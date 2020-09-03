FROM alpine
RUN apk add vsftpd
RUN apk add curl && apk add jq

RUN rm -rf /var/cache/apk/*

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./start.sh .

RUN chmod 755 start.sh

EXPOSE 20 21 30021-30026

ENTRYPOINT ./start.sh
