#!/usr/bin/env bash
set -e
# Ensure the staticfiles directory exists, collect static assets, then start Gunicorn
mkdir -p staticfiles
python manage.py collectstatic --noinput
exec gunicorn employeerecord.wsgi:application --bind 0.0.0.0:$PORT --workers 3 --log-level info
