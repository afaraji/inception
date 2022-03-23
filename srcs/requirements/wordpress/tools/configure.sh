#!/bin/sh

false
while [ $? -ne 0 ]
do
	sleep 1
	wp plugin install redis-cache --activate --path='/var/www/html' --allow-root
done

wp redis enable --path='/var/www/html' --allow-root

php-fpm7 -F
