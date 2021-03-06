FROM alpine:latest
ENV REFRESHED_AT 2022-02-06
ARG PORT=3000

RUN apk add --update yarn

ADD app /app

WORKDIR /app

EXPOSE $PORT/udp
EXPOSE $PORT/tcp
EXPOSE 3000/udp
EXPOSE 3000/tcp
CMD ["yarn", "start"]
