#!/bin/sh

chmod 600 ${ID_RSA}

adduser -D "$SSH_USER"
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

/usr/sbin/sshd

nginx -g "daemon off;"
