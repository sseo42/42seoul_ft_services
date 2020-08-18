FROM alpine:latest

RUN apk update && apk upgrade
RUN mkdir /etc/telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
RUN tar -xvf telegraf-1.15.2_linux_amd64.tar.gz

RUN cp /telegraf-1.15.2/usr/bin/telegraf /usr/bin/

RUN rm -rf *.tar.gz telegraf-1.15.2

RUN rm -rf /var/cache/apk/*

COPY telegraf_sample.conf /etc/telegraf/telegraf.conf
COPY start.sh

RUN chmod 755 start.sh

EXPOSE 4999

ENTRYPOINT ./start.sh
