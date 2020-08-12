#!/bin/bash

PRJ_BASE=$(pwd)
SRC_BASE=${PRJ_BASE}/srcs
NGINX_BASE=${SRC_BASE}/nginx
FTPS_BASE=${SRC_BASE}/ftps

kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml

cd ${NGINX_BASE}; make clean
cd ${FTPS_BASE}; make clean

kubectl delete secret nginxsecret
kubectl delete configmap nginxconfigmap
kubectl delete -f nginx.yaml
kubectl delete -f ftps.yaml
