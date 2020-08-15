#!/bin/bash

sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" /db_init.sql
sed -i "s/MYSQL_USER/$MYSQL_USER/g" /db_init.sql
sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /db_init.sql
sed -i 's/skip-networking//g' /etc/my.cnf.d/mariadb-server.cnf

nohup ./init_mysql.sh > /dev/null 2>&1 &
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
