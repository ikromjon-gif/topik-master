#!/usr/bin/env bash
# Migration'larni vaqtinchalik lokal PostgreSQL'da sinash.
# Talab: PostgreSQL 15+ (initdb, pg_ctl, psql PATH'da yoki PG_BIN orqali).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PG_BIN="${PG_BIN:-$(dirname "$(command -v pg_ctl 2>/dev/null || ls -d /usr/lib/postgresql/*/bin/pg_ctl 2>/dev/null | tail -1)")}"
DATA_DIR="$(mktemp -d)"
PORT="${PGTEST_PORT:-54329}"

cleanup() {
  "$PG_BIN/pg_ctl" -D "$DATA_DIR" -m immediate stop >/dev/null 2>&1 || true
  rm -rf "$DATA_DIR"
}
trap cleanup EXIT

"$PG_BIN/initdb" -D "$DATA_DIR" -U postgres --auth=trust >/dev/null
"$PG_BIN/pg_ctl" -D "$DATA_DIR" -o "-p $PORT -k $DATA_DIR -c listen_addresses=''" -w start >/dev/null

PSQL=("$PG_BIN/psql" -h "$DATA_DIR" -p "$PORT" -U postgres -d postgres -v ON_ERROR_STOP=1 -q)

"${PSQL[@]}" -f "$ROOT/supabase/tests/bootstrap.sql"
for f in "$ROOT"/supabase/migrations/*.sql; do
  echo "migration: $(basename "$f")"
  "${PSQL[@]}" -f "$f"
done
# So'rov natijalari yashiriladi; "ok — ..." xabarlari (NOTICE) stderr'da ko'rinadi.
"${PSQL[@]}" -o /dev/null -f "$ROOT/supabase/tests/content_rules.test.sql"
echo "Barcha testlar muvaffaqiyatli o'tdi."
