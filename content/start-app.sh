#!/bin/sh
set -eu

export ADMIN_NAME=$(printf '%s' "$ADMIN_NAME_B64" | base64 -d)
export ADMIN_EMAIL=$(printf '%s' "$ADMIN_EMAIL_B64" | base64 -d)
export ADMIN_PASSWORD=$(printf '%s' "$ADMIN_PASSWORD_B64" | base64 -d)

exec projectsend-entrypoint supervisord -c /etc/supervisord.conf
