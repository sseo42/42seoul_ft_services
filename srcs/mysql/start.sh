#!/bin/sh

sed -i "s/PMA_USER/$PMA_USER/g" /db_init.sql
sed -i "s/PMA_PASSWORD/$PMA_PASSWORD/g" /db_init.sql
sed -i "s/WP_USER/$WP_USER/g" /db_init.sql
sed -i "s/WP_PASSWORD/$WP_PASSWORD/g" /db_init.sql
sed -i 's/skip-networking//g' /etc/my.cnf.d/mariadb-server.cnf

nohup ./init_mysql.sh > /dev/null 2>&1 &
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
