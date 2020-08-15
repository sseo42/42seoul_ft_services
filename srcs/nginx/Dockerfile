FROM alpine

RUN apk update
RUN apk add nginx
RUN apk add --upgrade bash
RUN apk add openssl
RUN mkdir -p var/run/nginx

RUN rm -rf /var/cache/apk/*

COPY index.html /www/index.html
COPY start.sh .

RUN adduser -D -g 'www' www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

RUN chmod 755 /www/*
RUN chmod +x start.sh

EXPOSE 80 443
ENTRYPOINT ./start.sh
