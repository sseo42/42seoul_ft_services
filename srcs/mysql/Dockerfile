FROM alpine:latest

RUN apk update
RUN apk add mariadb mariadb-client
RUN rm -rf /var/cache/apk/*

COPY ./start.sh .
COPY ./init_mysql.sh .
COPY ./db_init.sql .
COPY ./wordpress.sql .

RUN chmod 755 start.sh
RUN chmod 755 init_mysql.sh

EXPOSE 3306

ENTRYPOINT ./start.sh
