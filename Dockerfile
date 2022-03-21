FROM python:latest

ENV FLASK_APP keg_api
ENV FLASK_ENV development

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

WORKDIR /app
CMD ./start.sh

