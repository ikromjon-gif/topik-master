#!/usr/bin/env bash
# Integratsiya testi: PostgreSQL (migrations + seed + fixture) → mock Supabase → Next.js → Playwright
# Talablar: PostgreSQL 15+, Python 3.11+ (psycopg[binary], pyjwt, playwright), Chrome/Chromium,
#           axe-core (AXE_PATH), root bo‘lmagan "postgres" foydalanuvchisi (initdb uchun).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO="$(cd "$HERE/../.." && pwd)"
PG_BIN="${PG_BIN:-$(ls -d /usr/lib/postgresql/*/bin | tail -1)}"
DATA="${PGDATA_DIR:-/tmp/sabaq-e2e-pg}"
TMP="$(mktemp -d)"
cleanup() {
  pkill -f mock_supabase.py 2>/dev/null || true
  pkill -f "next start -p 3200" 2>/dev/null || true
  su postgres -c "$PG_BIN/pg_ctl -D $DATA -m immediate stop" >/dev/null 2>&1 || true
  rm -f "$REPO/.env.local"
}
trap cleanup EXIT
cleanup; rm -rf "$DATA"
cp -r "$REPO/supabase" "$HERE/fixture.sql" "$TMP/" && chown -R postgres "$TMP"
su postgres -c "$PG_BIN/initdb -D $DATA -U postgres --auth=trust >/dev/null && $PG_BIN/pg_ctl -D $DATA -o \"-p 54329 -k $DATA -c listen_addresses=''\" -w start >/dev/null"
PSQL="$PG_BIN/psql -h $DATA -p 54329 -U postgres -d postgres -v ON_ERROR_STOP=1 -q -o /dev/null"
su postgres -c "$PSQL -f $TMP/supabase/tests/bootstrap.sql"
for f in "$TMP"/supabase/migrations/*.sql; do su postgres -c "$PSQL -f $f"; done
su postgres -c "$PSQL -f $TMP/supabase/seed/content.sql"
su postgres -c "$PSQL -f $TMP/fixture.sql"
python3 "$HERE/mock_supabase.py" "host=$DATA port=54329 user=postgres dbname=postgres" 54321 > /tmp/sabaq-mock.out 2>&1 &
sleep 1.5
cd "$REPO"
printf 'NEXT_PUBLIC_SUPABASE_URL=http://127.0.0.1:54321\nNEXT_PUBLIC_SUPABASE_ANON_KEY=mock-anon-key\n' > .env.local
NEXT_TELEMETRY_DISABLED=1 npm run build > /tmp/sabaq-e2e-build.log 2>&1
npx next start -p 3200 > /tmp/sabaq-e2e-next.log 2>&1 &
sleep 4
python3 "$HERE/e2e_test.py"
