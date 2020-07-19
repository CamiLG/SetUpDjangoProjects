#!/bin/bash
set -e
if [ ! -d .env ]; then
python3 -m venv .env
source .env/bin/activate
pip3 install -r requirements.txt
fi
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py createsuperuser
python3 manage.py runserver &
sleep 4
xdg-open http://localhost:8000
