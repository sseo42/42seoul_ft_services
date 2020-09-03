FROM alpine:latest

RUN apk update
RUN mkdir /etc/telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN rm -rf /var/cache/apk/*

RUN tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
RUN cp /telegraf/telegraf /usr/bin/

RUN rm -rf *.tar.gz /telegraf

COPY start.sh .

RUN chmod 755 start.sh

ENTRYPOINT ./start.sh
