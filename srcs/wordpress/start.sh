#!/bin/sh

if [ ! -f "/wordpress/wp-config.php" ]; then
	tar -xvf latest.tar.gz
	mv /wp-config.php /wordpress/wp-config.php
fi

php -S 0.0.0.0:5050 -t /wordpress/
