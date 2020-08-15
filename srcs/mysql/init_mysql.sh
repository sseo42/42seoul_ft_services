#!/bin/bash

until mysql
do
	echo "waiting mysql"
done

mysql -u root --skip-password < db_init.sql
