FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --upgrade bash
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN mkdir www

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz -C /www

RUN rm -rf /var/cache/apk/*

COPY config.inc.php /www/config.inc.php
COPY start.sh .

#VOLUME

EXPOSE 5000

ENTRYPOINT ./start.sh
