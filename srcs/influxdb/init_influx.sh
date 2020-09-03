#!/bin/sh

until influx -import -path=db_init.influx
do
	echo "waiting influx"
done
