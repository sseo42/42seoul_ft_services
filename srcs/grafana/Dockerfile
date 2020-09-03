FROM alpine:latest

RUN apk update
RUN wget https://dl.grafana.com/oss/release/grafana-7.1.3.linux-amd64.tar.gz
RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN rm -rf /var/cache/apk/*

RUN tar -xvf grafana-7.1.3.linux-amd64.tar.gz

COPY datasource.yaml /grafana-7.1.3/conf/provisioning/datasources/datasource.yaml
COPY dashboard.yaml /grafana-7.1.3/conf/provisioning/dashboards/dashboard.yaml

COPY dashboards/nginx_dashboard.json /grafana-7.1.3/conf/provisioning/dashboards/nginx_dashboard.json
COPY dashboards/mysql_dashboard.json /grafana-7.1.3/conf/provisioning/dashboards/mysql_dashboard.json
COPY dashboards/phpmyadmin_dashboard.json /grafana-7.1.3/conf/provisioning/dashboards/phpmyadmin_dashboard.json
COPY dashboards/wordpress_dashboard.json /grafana-7.1.3/conf/provisioning/dashboards/wordpress_dashboard.json
COPY dashboards/influxdb_dashboard.json /grafana-7.1.3/conf/provisioning/dashboards/influxdb_dashboard.json
COPY dashboards/ftps_dashboard.json /grafana-7.1.3/conf/provisioning/dashboards/ftps_dashboard.json
COPY dashboards/grafana_dashboard.json /grafana-7.1.3/conf/provisioning/dashboards/grafana_dashboard.json

COPY start.sh .

RUN chmod 755 start.sh

EXPOSE 3000

ENTRYPOINT ./start.sh
