#!/bin/sh
set -eu

python - <<'PY'
import os
import time

import psycopg

dsn = {
    "host": os.environ.get("POSTGRES_HOST", "db"),
    "port": os.environ.get("POSTGRES_PORT", "5432"),
    "user": os.environ.get("POSTGRES_USER", "salaya"),
    "password": os.environ.get("POSTGRES_PASSWORD", "salaya"),
    "dbname": os.environ.get("POSTGRES_DB", "salaya"),
}

for attempt in range(30):
    try:
        with psycopg.connect(**dsn) as conn:
            conn.execute("SELECT 1")
        break
    except Exception as exc:
        print(f"waiting for postgres ({attempt + 1}/30): {exc}")
        time.sleep(1)
else:
    raise SystemExit("postgres did not become ready")
PY

python manage.py migrate --noinput
exec "$@"
