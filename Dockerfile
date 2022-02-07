FROM a;pine:latest
ENV REFRESHED_AT 2022-02-06

RUN apk add --update yarn0
RUN yarn install

ADD . /app

WORKDIR /app

CMD ["yarn", "start"]

EXPOSE 3000/udp
EXPOSE 3000/tcp
