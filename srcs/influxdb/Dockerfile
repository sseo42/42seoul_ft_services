FROM alpine:latest

RUN apk update
RUN apk add --upgrade bash
RUN apk add influxdb

COPY start.sh .

RUN chmod 755 start.sh

EXPOSE 8086

ENTRYPOINT ./start.sh
