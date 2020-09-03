#!/bin/bash

PRJ_DIR=$(pwd)
SRC_DIR=${PRJ_DIR}/srcs
NGINX_DIR=${SRC_DIR}/nginx
MYSQL_DIR=${SRC_DIR}/mysql
PHPMYADMIN_DIR=${SRC_DIR}/phpmyadmin
WORDPRESS_DIR=${SRC_DIR}/wordpress
GRAFANA_DIR=${SRC_DIR}/grafana
INFLUXDB_DIR=${SRC_DIR}/influxdb
TELEGRAF_DIR=${SRC_DIR}/telegraf
FTPS_DIR=${SRC_DIR}/ftps

SERVICE_LIST="nginx mysql phpmyadmin wordpress grafana influxdb telegraf ftps"

for SERVICE in $SERVICE_LIST
do
	kubectl delete -f $SRC_DIR/$SERVICE/$SERVICE.yaml
done

kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml

kubectl delete secret nginx-secrets
kubectl delete configmap nginx-config
kubectl delete secret ftps-secrets
kubectl delete configmap telegraf-config

cd ${NGINX_DIR}; make clean
cd ${FTPS_DIR}; make clean
