#!/bin/bash

# Activate virtual environment if used
# source venv/bin/activate

# Start Nginx
service nginx start

# Start your Flask application
python useragentapp/app.py