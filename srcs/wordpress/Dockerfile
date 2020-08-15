FROM alpine:latest

RUN apk update
RUN apk --upgrade bash
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xvf latest.tar.gz

RUN rm -rf /var/cache/apk/*

COPY wp-config.php /wordpress/wp-config.php
COPY start.sh .

RUN chmod 755 start.sh

EXPOSE 80

#ENTRYPOINT ./start.sh
