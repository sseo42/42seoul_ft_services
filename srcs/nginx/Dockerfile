FROM alpine

RUN apk update
RUN apk add nginx
RUN apk add --no-cache --upgrade bash
RUN mkdir -p var/run/nginx
RUN apk add openssl
RUN apk add openssh
RUN apk add expect

RUN rm -rf /var/cache/apk/*

COPY index.html /www/index.html
COPY sshd_config /etc/ssh/sshd_config
COPY root_passwd .
COPY start.sh .

RUN adduser -D -g 'www' www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

RUN chmod 755 /www/*
RUN chmod +x start.sh

EXPOSE 30022 80 443
RUN chpasswd < ./root_passwd
ENTRYPOINT ./start.sh
