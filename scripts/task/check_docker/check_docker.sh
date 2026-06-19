#!/bin/bash

if curl -s http://localhost:5000 > /dev/null; then
  echo "Flask app is running on port 5000!"
  exit 0
else
  echo "Flask app is not running on port 5000."
  exit 1
fi
