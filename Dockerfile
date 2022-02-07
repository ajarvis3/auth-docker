FROM alpine:latest
ENV REFRESHED_AT 2022-02-06
ARG PORT=3000

RUN apk add --update yarn
RUN apk add py3-pip
RUN pip install gunicorn

ADD app /app

WORKDIR /app

CMD gunicorn --bind 0.0.0.0:$PORT wsgi
