from django.core.cache import cache
from django.db import connection
from django.http import JsonResponse


def health(_request):
    database_ok = True
    redis_ok = True

    try:
        connection.ensure_connection()
    except Exception:
        database_ok = False

    try:
        cache.set("healthcheck", "ok", 5)
        redis_ok = cache.get("healthcheck") == "ok"
    except Exception:
        redis_ok = False

    healthy = database_ok and redis_ok
    return JsonResponse(
        {
            "status": "ok" if healthy else "degraded",
            "database": database_ok,
            "redis": redis_ok,
        },
        status=200 if healthy else 503,
    )
