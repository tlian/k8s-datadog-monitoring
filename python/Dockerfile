FROM python:3.7.9-buster

LABEL author="Thawngzapum Lian"
LABEL email="lianth01@risk.regn.net"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

COPY ./flaskapp/requirements.txt /app/requirements.txt
WORKDIR /app

RUN pip install -r requirements.txt

COPY ./flaskapp/static/* /app/static/
COPY ./flaskapp/templates/* /app/templates/
COPY ./flaskapp/flaskblog.py /app/flaskblog.py

ARG flask_debug_mode=1
ENV FLASK_DEBUG=$flask_debug_mode
ENV FLASK_APP=flaskblog.py

EXPOSE 5000

ENTRYPOINT [ "python" ]

CMD [ "flaskblog.py" ]
