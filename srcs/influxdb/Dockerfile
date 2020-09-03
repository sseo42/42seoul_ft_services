FROM alpine:latest

RUN apk update
RUN apk add influxdb
RUN rm -rf /var/cache/apk/*

COPY init_influx.sh .
COPY db_init.influx .
COPY start.sh .

RUN chmod 755 db_init.influx
RUN chmod 755 init_influx.sh
RUN chmod 755 start.sh

EXPOSE 8086

ENTRYPOINT ./start.sh
