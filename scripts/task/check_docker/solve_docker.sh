#!/bin/bash

nohup /root/.venv/bin/python /root/app.py > /var/log/flask-app.log 2>&1 &
sleep 3
echo "Flask app started."
exit 0
