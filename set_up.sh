#!/bin/bash

PRJ_DIR=$(pwd)
SRC_DIR=${PRJ_DIR}/srcs
NGINX_DIR=${SRC_DIR}/nginx
FTPS_DIR=${SRC_DIR}/ftps
MYSQL_DIR=${SRC_DIR}/mysql
PHPMYADMIN_DIR=${SRC_DIR}/phpmyadmin
WORDPRESS_DIR=${SRC_DIR}/wordpress
GRAFANA_DIR=${SRC_DIR}/grafana
INFLUXDB_DIR=${SRC_DIR}/influxdb
TELEGRAF_DIR=${SRC_DIR}/telegraf

#set ARP for routing
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

#enable docker deamon
eval $(minikube -p minikube docker-env)

#install metalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ${SRC_DIR}/metallb/config.yaml

#build nginx
cd ${NGINX_DIR}; make keys

kubectl create secret tls nginx-secret --key ${NGINX_DIR}/nginx.key --cert ${NGINX_DIR}/nginx.crt
kubectl create configmap nginx-configmap --from-file=${NGINX_DIR}/nginx.conf

docker build -t sseo_nginx:1.0 ${NGINX_DIR}
kubectl apply -f ${NGINX_DIR}/nginx.yaml

#build ftps
cd ${FTPS_DIR}; make pem
docker build -t sseo_ftps:1.0 ${FTPS_DIR}
kubectl apply -f ${FTPS_DIR}/ftps.yaml

#build mysql
docker build -t sseo_mysql:1.0 ${MYSQL_DIR}
kubectl apply -f ${MYSQL_DIR}/mysql.yaml

#build phpmyadmin
docker build -t sseo_phpmyadmin:1.0 ${PHPMYADMIN_DIR}
kubectl apply -f ${PHPMYADMIN_DIR}/phpmyadmin.yaml

#build wordpress
docker build -t sseo_wordpress:1.0 ${WORDPRESS_DIR}
kubectl apply -f ${WORDPRESS_DIR}/wordpress.yaml

#build grafana
docker build -t sseo_grafana:1.0 ${GRAFANA_DIR}
kubectl apply -f ${GRAFANA_DIR}/grafana.yaml

#build influxdb
docker build -t sseo_influxdb:1.0 ${INFLUXDB_DIR}
kubectl apply -f ${INFLUXDB_DIR}/influxdb.yaml

#build telegraf
docker build -t sseo_telegraf:1.0 ${TELEGRAF_DIR}
kubectl apply -f ${TELEGRAF_DIR}/telegraf.yaml
