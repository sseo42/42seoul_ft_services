FROM alpine:latest

RUN apk update
RUN apk add php7 php7-session php7-json php7-mbstring php7-mysqli php7-opcache php7-zlib php7-gd php7-curl

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz

RUN mv phpMyAdmin-4.9.0.1-all-languages phpmyadmin

RUN rm -rf /var/cache/apk/*

COPY config.inc.php /phpmyadmin/config.inc.php
COPY start.sh .

RUN chmod 755 start.sh

EXPOSE 5000

ENTRYPOINT ./start.sh
