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

#start minikube
if [[ $(minikube status | grep -c "Running") == 0 ]]
then
    minikube start --cpus=2 --memory 4000 --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
fi

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

#makefile
cd ${NGINX_DIR}; make keys
cd ${FTPS_DIR}; make keys

#secret & configmap
kubectl create secret tls nginx-secrets --key ${NGINX_DIR}/nginx.key --cert ${NGINX_DIR}/nginx.crt
kubectl create configmap nginx-config --from-file=${NGINX_DIR}/nginx.conf
kubectl create secret tls ftps-secrets --key ${FTPS_DIR}/ftps.key --cert ${FTPS_DIR}/ftps.crt
kubectl create configmap telegraf-config --from-file=${TELEGRAF_DIR}/telegraf.conf

for SERVICE in $SERVICE_LIST
do
    docker build -t sseo_$SERVICE:1.0 ${SRC_DIR}/$SERVICE
done

for SERVICE in $SERVICE_LIST
do
    kubectl apply -f ${SRC_DIR}/$SERVICE/$SERVICE.yaml
done
