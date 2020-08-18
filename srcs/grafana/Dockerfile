FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --upgrade bash
RUN wget https://dl.grafana.com/oss/release/grafana-7.1.3.linux-amd64.tar.gz
RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN tar -xvf grafana-7.1.3.linux-amd64.tar.gz

RUN rm -rf /var/cache/apk/*

COPY start.sh .

RUN chmod 755 start.sh

EXPOSE 3000

ENTRYPOINT ./start.sh
