#!/bin/sh

# Create user
adduser -D -h /home/./$FTP_USER -s /bin/false  $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER

# Point to the internal API server hostname
APISERVER=https://kubernetes.default.svc

# Path to ServiceAccount token
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount

# Read this Pod's namespace
NAMESPACE=$(cat ${SERVICEACCOUNT}/namespace)

# Read the ServiceAccount bearer token
TOKEN=$(cat ${SERVICEACCOUNT}/token)

# Reference the internal certificate authority (CA)
CACERT=${SERVICEACCOUNT}/ca.crt

SERVICE=ftps-service

# Explore the API with TOKEN
PASV_ADDR=""
until [ ! $PASV_ADDR == "" ]
do
	PASV_ADDR=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/$NAMESPACE/services/$SERVICE/ 2> /dev/null | jq -r '.status | .loadBalancer | .ingress | .[] | .ip')
done

# Set pasv_address
sed -i "s/pasv_address=.*/pasv_address=${PASV_ADDR}/g" /etc/vsftpd/vsftpd.conf

# Run the vsftpd server
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
