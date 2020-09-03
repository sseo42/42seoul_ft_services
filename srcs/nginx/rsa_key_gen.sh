#!/bin/bash

ID_RSA=ssh_host_rsa_key

#  do only when there is no ssh_host_rsa_key
if [ ! -f $ID_RSA ]; then       
expect -c "spawn ssh-keygen -t rsa" \
                   -c "expect -re \":\"" \
                   -c "send \"${ID_RSA}\r\"" \
                   -c "expect -re \":\"" \
                   -c "send \"\r\"" \
                   -c "expect -re \":\"" \
                   -c "send \"\r\"" \
				   -c "interact"
fi
