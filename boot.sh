#!/bin/bash
source venv/bin/activate
exec gunicorn -b :5000 --workers=4 --worker-class gevent --access-logfile - --error-logfile - main:app