#!/bin/sh

if [ -d "/run/mysqld" ]; then
	echo "[i] mysqld already present, skipping creation"
	chown -R mysql:mysql /run/mysqld
else
	echo "[i] mysqld not found, creating...."
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
	echo "[i] MySQL directory already present, skipping creation"
	chown -R mysql:mysql /var/lib/mysql
else
	echo "[i] MySQL data directory not found, creating initial DBs"

	chown -R mysql:mysql /var/lib/mysql

	mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

	MYSQL_ROOT_PASSWORD="password"
	# MYSQL_DATABASE=${MYSQL_DATABASE:-""}
	# MYSQL_USER=${MYSQL_USER:-""}
	# MYSQL_PASSWORD=${MYSQL_PASSWORD:-""}
	MYSQL_DATABASE="wordpress"
	MYSQL_USER="wordpress"
	MYSQL_PASSWORD="password"

	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < /config/init.sql

	echo
	echo '---- MySQL init process done. ----'
	echo
	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < /config/wordpress.sql
	echo
	echo '---- wordpress init done. Ready for start up. ----'
	echo
	echo "exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0" "$@"
fi

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@

