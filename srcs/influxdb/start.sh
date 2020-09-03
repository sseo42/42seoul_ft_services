#!/bin/sh

sed -i "s/INFLUXDB_DB/$INFLUXDB_DB/g" /db_init.influx
sed -i "s/INFLUXDB_USER/$INFLUXDB_USER/g" /db_init.influx
sed -i "s/INFLUXDB_PASSWORD/$INFLUXDB_PASSWORD/g" /db_init.influx

nohup ./init_influx.sh > /dev/null 2>&1 &
influxd run -config /etc/influxdb.conf
