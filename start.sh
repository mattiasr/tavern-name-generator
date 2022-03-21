#!/bin/sh
export FLASK_APP=keg_api
export FLASK_ENV=development

if [ -f venv ]; then
	. venv/bin/activate
fi

pip install -r requirements.txt

flask init-db
flask routes
flask run --host=0.0.0.0
