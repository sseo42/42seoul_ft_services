FROM alpine:latest

RUN apk update
RUN apk add mariadb mariadb-client
RUN apk add --no-cache --upgrade bash
RUN rm -rf /var/cache/apk/*

COPY ./start.sh .
COPY ./init_mysql.sh .
COPY ./db_init.sql .

RUN chmod 755 start.sh
RUN chmod 755 init_mysql.sh

#VOLUME /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ./start.sh
