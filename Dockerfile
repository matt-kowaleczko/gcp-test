FROM python:3.7-buster

RUN adduser app

WORKDIR /app

RUN python -m venv venv
RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install gunicorn
RUN venv/bin/pip install gunicorn[gevent]
RUN venv/bin/pip install flask

COPY main.py wsgi.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP main.py

RUN chown -R app:app ./
USER app

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]