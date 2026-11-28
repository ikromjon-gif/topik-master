"""
Sabaq integratsiya testlari uchun mock Supabase (Auth + PostgREST + Storage sign).
Faqat ilova ishlatadigan qism. So‘rovlar haqiqiy PostgreSQL'da
`authenticated` roli va `request.jwt.claim.sub` bilan bajariladi — RLS haqiqiy.
"""
import json, re, time, uuid, hashlib, sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import urlparse, parse_qsl, unquote
import jwt, psycopg
from psycopg import sql

DSN = sys.argv[1] if len(sys.argv) > 1 else "host=/tmp/pgdata port=54329 user=postgres dbname=postgres"
PORT = int(sys.argv[2]) if len(sys.argv) > 2 else 54321
SECRET = "mock-secret-for-tests-only-0123456789"
LOG = open("/tmp/mock_supabase.log", "a")

def conn():
    return psycopg.connect(DSN, autocommit=False)

# ---------- schema introspection (FK) ----------
FKS = []  # (table, column, ref_table, ref_column)
def load_fks():
    with conn() as c:
        rows = c.execute("""
          select tc.table_name, kcu.column_name, ccu.table_name, ccu.column_name
          from information_schema.table_constraints tc
          join information_schema.key_column_usage kcu on tc.constraint_name = kcu.constraint_name and tc.table_schema = kcu.table_schema
          join information_schema.constraint_column_usage ccu on tc.constraint_name = ccu.constraint_name and tc.table_schema = ccu.table_schema
          where tc.constraint_type = 'FOREIGN KEY' and tc.table_schema = 'public'""").fetchall()
        FKS.extend(rows)
    with conn() as c:
        c.execute("create table if not exists public._mock_auth (email text primary key, user_id uuid not null, pw text not null)")
        c.commit()

def relation(base, rel, alias):
    many_to_one = [f for f in FKS if f[0] == base and f[2] == rel]
    if many_to_one:
        pick = [f for f in many_to_one if f[1] == f"{alias}_id"] or many_to_one
        return ("m2o", pick[0][1], pick[0][3])
    one_to_many = [f for f in FKS if f[0] == rel and f[2] == base]
    if one_to_many:
        return ("o2m", one_to_many[0][1], one_to_many[0][3])
    raise ValueError(f"FK topilmadi: {base} -> {rel}")

# ---------- select parsing ----------
def split_top(s):
    out, depth, cur = [], 0, ""
    for ch in s:
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        if ch == "," and depth == 0:
            out.append(cur.strip()); cur = ""
        else:
            cur += ch
    if cur.strip():
        out.append(cur.strip())
    return out

def parse_select(s):
    items = []
    for part in split_top(s or "*"):
        m = re.match(r"^(?:(\w+):)?(\w+)(?:!(\w+))?\((.*)\)$", part, re.S)
        if m:
            alias, rel, hint, inner = m.groups()
            items.append({"embed": True, "alias": alias or rel, "rel": rel, "inner": hint == "inner", "select": parse_select(inner)})
        else:
            m2 = re.match(r"^(?:(\w+):)?(\w+|\*)$", part)
            alias, col = m2.groups()
            items.append({"embed": False, "alias": alias or col, "col": col})
    return items

# ---------- filters ----------
def lit(v):
    return sql.Literal(v)

def cond(col_ident, op_val):
    op, _, val = op_val.partition(".")
    neg = False
    if op == "not":
        neg = True
        op, _, val = val.partition(".")
    if op in ("eq", "neq", "gt", "gte", "lt", "lte"):
        sym = {"eq": "=", "neq": "<>", "gt": ">", "gte": ">=", "lt": "<", "lte": "<="}[op]
        c = sql.SQL("{} " + sym + " {}").format(col_ident, lit(val))
    elif op in ("like", "ilike"):
        c = sql.SQL("{}::text " + op + " {}").format(col_ident, lit(val.replace("*", "%")))
    elif op == "is":
        c = sql.SQL("{} is " + {"null": "null", "true": "true", "false": "false"}[val]).format(col_ident)
    elif op == "in":
        vals = [v.strip().strip('"') for v in val.strip("()").split(",") if v.strip()]
        c = sql.SQL("{} in ({})").format(col_ident, sql.SQL(",").join(lit(v) for v in vals)) if vals else sql.SQL("false")
    else:
        raise ValueError(f"operator qo‘llanmaydi: {op}")
    return sql.SQL("not ({})").format(c) if neg else c

RESERVED = {"select", "order", "limit", "offset", "on_conflict", "columns"}

def build_select(table, items, filters, embed_filters, alias_path=""):
    """Bitta jadval uchun select ifodasi (alias t_<n>)."""
    t = sql.Identifier(f"t{abs(hash(alias_path or table)) % 10**8}")
    cols = []
    wheres = []
    for it in items:
        if not it["embed"]:
            if it["col"] == "*":
                cols.append(sql.SQL("{}.*").format(t))
            else:
                cols.append(sql.SQL("{}.{} as {}").format(t, sql.Identifier(it["col"]), sql.Identifier(it["alias"])))
            continue
        path = f"{alias_path}.{it['alias']}" if alias_path else it["alias"]
        kind, fkcol, refcol = relation(table, it["rel"], it["alias"])
        sub_filters = embed_filters.get(path, [])
        inner_sel, inner_alias = build_select(it["rel"], it["select"], sub_filters, embed_filters, path)
        if kind == "m2o":
            link = sql.SQL("{}.{} = {}.{}").format(inner_alias, sql.Identifier(refcol), t, sql.Identifier(fkcol))
            sub = sql.SQL("(select row_to_json(x) from ({} and {}) x limit 1)").format(inner_sel, link)
        else:
            link = sql.SQL("{}.{} = {}.{}").format(inner_alias, sql.Identifier(fkcol), t, sql.Identifier(refcol))
            sub = sql.SQL("(select coalesce(json_agg(row_to_json(x)), '[]'::json) from ({} and {}) x)").format(inner_sel, link)
        cols.append(sql.SQL("{} as {}").format(sub, sql.Identifier(it["alias"])))
        if it["inner"] or sub_filters:
            if kind == "m2o":
                wheres.append(sql.SQL("{} is not null").format(sub))
            else:
                wheres.append(sql.SQL("json_array_length({}) > 0").format(sub))
    for col, opv in filters:
        wheres.append(cond(sql.SQL("{}.{}").format(t, sql.Identifier(col)), opv))
    where = sql.SQL(" and ").join(wheres) if wheres else sql.SQL("true")
    q = sql.SQL("select {} from public.{} {} where {}").format(sql.SQL(", ").join(cols), sql.Identifier(table), t, where)
    return q, t

def parse_query(qs):
    filters, embed_filters, opts = [], {}, {}
    for k, v in qs:
        if k in RESERVED:
            opts[k] = v
        elif "." in k:
            path, col = k.rsplit(".", 1)
            embed_filters.setdefault(path, []).append((col, v))
        else:
            filters.append((k, v))
    return filters, embed_filters, opts

def order_sql(order, t):
    parts = []
    for p in order.split(","):
        bits = p.split(".")
        col = bits[0]
        d = "desc" if "desc" in bits[1:] else "asc"
        nulls = " nulls first" if "nullsfirst" in bits else (" nulls last" if "nullslast" in bits else "")
        parts.append(sql.SQL("{}.{} " + d + nulls).format(t, sql.Identifier(col)))
    return sql.SQL(", ").join(parts)

# ---------- auth ----------
def make_session(user_id, email):
    now = int(time.time())
    tok = jwt.encode({"sub": user_id, "email": email, "role": "authenticated", "aud": "authenticated", "exp": now + 3600, "iat": now}, SECRET, algorithm="HS256")
    user = {"id": user_id, "aud": "authenticated", "role": "authenticated", "email": email, "email_confirmed_at": "2026-01-01T00:00:00Z",
            "app_metadata": {"provider": "email"}, "user_metadata": {}, "created_at": "2026-01-01T00:00:00Z", "updated_at": "2026-01-01T00:00:00Z", "identities": []}
    return {"access_token": tok, "token_type": "bearer", "expires_in": 3600, "expires_at": now + 3600, "refresh_token": f"rt-{user_id}-{now}", "user": user}

def user_from_auth(header):
    if not header or not header.lower().startswith("bearer "):
        return None
    try:
        p = jwt.decode(header[7:], SECRET, algorithms=["HS256"], audience="authenticated")
        return p if p.get("role") == "authenticated" and p.get("sub") else None
    except Exception:
        return None

class H(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.1"
    def log_message(self, *a):
        pass

    def send(self, code, body=None, extra=None):
        data = b"" if body is None else json.dumps(body, default=str).encode()
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(data)))
        for k, v in (extra or {}).items():
            self.send_header(k, v)
        self.end_headers()
        self.wfile.write(data)
        LOG.write(f"{self.command} {self.path} -> {code}\n"); LOG.flush()

    def body(self):
        n = int(self.headers.get("Content-Length") or 0)
        return json.loads(self.rfile.read(n) or b"null") if n else None

    def do_GET(self): self.route()
    def do_POST(self): self.route()
    def do_PATCH(self): self.route()
    def do_DELETE(self): self.route()
    def do_HEAD(self): self.route()

    def route(self):
        u = urlparse(self.path)
        try:
            if u.path.startswith("/auth/v1/"):
                return self.auth(u)
            if u.path.startswith("/rest/v1/"):
                return self.rest(u)
            if u.path.startswith("/storage/v1/object/sign/"):
                p = u.path[len("/storage/v1/object/sign/"):]
                return self.send(200, {"signedURL": f"/object/sign/{p}?token=mock"})
            self.send(404, {"message": "not found"})
        except psycopg.Error as e:
            diag = e.diag
            self.send(400, {"code": diag.sqlstate, "message": diag.message_primary or str(e), "details": diag.message_detail, "hint": diag.message_hint})
        except Exception as e:  # noqa
            self.send(400, {"code": "MOCK", "message": str(e)})

    def auth(self, u):
        path = u.path[len("/auth/v1/"):]
        qs = dict(parse_qsl(u.query))
        if path == "signup" and self.command == "POST":
            b = self.body()
            email, pw = b["email"].lower(), b["password"]
            with conn() as c:
                if c.execute("select 1 from public._mock_auth where email = %s", (email,)).fetchone():
                    return self.send(422, {"code": 422, "error_code": "user_already_exists", "msg": "User already registered"})
                uid = str(uuid.uuid4())
                c.execute("insert into auth.users (id, email) values (%s, %s)", (uid, email))
                c.execute("insert into public._mock_auth values (%s, %s, %s)", (email, uid, hashlib.sha256(pw.encode()).hexdigest()))
                c.commit()
            return self.send(200, make_session(uid, email))
        if path == "token" and qs.get("grant_type") == "password":
            b = self.body()
            with conn() as c:
                r = c.execute("select user_id, pw from public._mock_auth where email = %s", (b["email"].lower(),)).fetchone()
            if not r or r[1] != hashlib.sha256(b["password"].encode()).hexdigest():
                return self.send(400, {"code": 400, "error_code": "invalid_credentials", "msg": "Invalid login credentials"})
            return self.send(200, make_session(str(r[0]), b["email"].lower()))
        if path == "token" and qs.get("grant_type") == "refresh_token":
            b = self.body()
            uid = b["refresh_token"].split("-", 1)[1].rsplit("-", 1)[0]
            with conn() as c:
                r = c.execute("select email from public._mock_auth where user_id = %s", (uid,)).fetchone()
            return self.send(200, make_session(uid, r[0])) if r else self.send(400, {"msg": "invalid refresh"})
        if path == "user":
            p = user_from_auth(self.headers.get("Authorization"))
            if not p:
                return self.send(401, {"code": 401, "msg": "invalid JWT"})
            return self.send(200, make_session(p["sub"], p["email"])["user"])
        if path == "logout":
            return self.send(204)
        return self.send(404, {"msg": f"auth: {path}"})

    def rest(self, u):
        table = u.path[len("/rest/v1/"):]
        qs = parse_qsl(u.query, keep_blank_values=True)
        filters, embed_filters, opts = parse_query(qs)
        p = user_from_auth(self.headers.get("Authorization"))
        prefer = self.headers.get("Prefer", "")
        accept = self.headers.get("Accept", "")
        with conn() as c:
            if p:
                c.execute("set local role authenticated")
                c.execute("select set_config('request.jwt.claim.sub', %s, true)", (p["sub"],))
            else:
                c.execute("set local role anon")
            if self.command in ("GET", "HEAD"):
                items = parse_select(opts.get("select", "*"))
                q, t = build_select(table, items, filters, embed_filters)
                if "order" in opts:
                    q = sql.SQL("{} order by {}").format(q, order_sql(opts["order"], t))
                if "limit" in opts:
                    q = sql.SQL("{} limit {}").format(q, sql.Literal(int(opts["limit"])))
                if "offset" in opts:
                    q = sql.SQL("{} offset {}").format(q, sql.Literal(int(opts["offset"])))
                rows = c.execute(sql.SQL("select coalesce(json_agg(z), '[]'::json) from ({}) z").format(q)).fetchone()[0]
                c.commit()
                return self.respond(rows, accept)
            if self.command == "POST":
                b = self.body()
                rows_in = b if isinstance(b, list) else [b]
                cols = list(rows_in[0].keys())
                values = sql.SQL(", ").join(
                    sql.SQL("({})").format(sql.SQL(", ").join(sql.Literal(r.get(k)) if not isinstance(r.get(k), (dict, list)) else sql.Literal(json.dumps(r.get(k))) for k in cols))
                    for r in rows_in)
                q = sql.SQL("insert into public.{} ({}) values {}").format(sql.Identifier(table), sql.SQL(", ").join(map(sql.Identifier, cols)), values)
                if "on_conflict" in opts:
                    oc = [x.strip() for x in opts["on_conflict"].split(",")]
                    if "ignore-duplicates" in prefer:
                        q = sql.SQL("{} on conflict ({}) do nothing").format(q, sql.SQL(", ").join(map(sql.Identifier, oc)))
                    else:
                        upd = [k for k in cols if k not in oc]
                        q = sql.SQL("{} on conflict ({}) do update set {}").format(q, sql.SQL(", ").join(map(sql.Identifier, oc)),
                            sql.SQL(", ").join(sql.SQL("{} = excluded.{}").format(sql.Identifier(k), sql.Identifier(k)) for k in upd))
                q = sql.SQL("{} returning *").format(q)
                rows = [dict(zip([d.name for d in cur.description], r)) for cur in [c.execute(q)] for r in cur.fetchall()]
                c.commit()
                if "return=representation" in prefer:
                    if "select" in opts and rows:
                        ids = [str(r["id"]) for r in rows if "id" in r]
                        items = parse_select(opts["select"])
                        with conn() as c2:
                            if p:
                                c2.execute("set local role authenticated")
                                c2.execute("select set_config('request.jwt.claim.sub', %s, true)", (p["sub"],))
                            sq, t = build_select(table, items, [("id", f"in.({','.join(ids)})")], {})
                            rows = c2.execute(sql.SQL("select coalesce(json_agg(z), '[]'::json) from ({}) z").format(sq)).fetchone()[0]
                    return self.respond(rows, accept, 201)
                return self.send(201)
            if self.command == "PATCH":
                b = self.body()
                t = sql.Identifier(table)
                sets = sql.SQL(", ").join(sql.SQL("{} = {}").format(sql.Identifier(k), sql.Literal(v)) for k, v in b.items())
                wheres = [cond(sql.SQL("{}.{}").format(t, sql.Identifier(col)), opv) for col, opv in filters] or [sql.SQL("true")]
                c.execute(sql.SQL("update public.{} set {} where {}").format(t, sets, sql.SQL(" and ").join(wheres)))
                c.commit()
                return self.send(204)
            if self.command == "DELETE":
                t = sql.Identifier(table)
                wheres = [cond(sql.SQL("{}.{}").format(t, sql.Identifier(col)), opv) for col, opv in filters] or [sql.SQL("false")]
                c.execute(sql.SQL("delete from public.{} where {}").format(t, sql.SQL(" and ").join(wheres)))
                c.commit()
                return self.send(204)
        self.send(405, {"message": "method"})

    def respond(self, rows, accept, code=200):
        if "vnd.pgrst.object" in accept:
            if len(rows) != 1:
                return self.send(406, {"code": "PGRST116", "message": "JSON object requested, multiple (or no) rows returned", "details": f"{len(rows)} rows"})
            return self.send(code, rows[0])
        return self.send(code, rows)

if __name__ == "__main__":
    load_fks()
    print(f"mock supabase :{PORT}", flush=True)
    ThreadingHTTPServer(("127.0.0.1", PORT), H).serve_forever()
