FROM alpine

RUN apk update
RUN apk add nginx
RUN apk add openssh
RUN mkdir -p var/run/nginx

RUN rm -rf /var/cache/apk/*


COPY index.html /www/index.html
COPY sshd_config /etc/ssh/sshd_config
COPY ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
COPY start.sh .

RUN chown -R nginx:nginx /www

RUN chmod 755 /www/*
RUN chmod +x start.sh

EXPOSE 80 443 30020
ENTRYPOINT ./start.sh
