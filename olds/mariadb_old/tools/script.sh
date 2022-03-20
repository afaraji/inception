#!/bin/sh
# DATABASE='wordpress'
# DB_USER='wordpress'
# DB_PASSWORD='password'

# if !  ls var/lib/myqsl/sys &>/dev/null; then

# 	/etc/init.d/mariadb setup
# 	/etc/init.d/mariadb start
# 	mysql -u root -e "CREATE DATABASE $DATABASE; CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';"
# 	mysql -u root -e "CREATE USER 'afaraji'@'%' IDENTIFIED BY 'afaraji'"
# 	mysql -u root < wordpress.sql
# 	sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
# 	sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
# 	# mysql -u root -e "alter user 'root'@'localhost' identified by 'afaraji'";
# 	/etc/init.d/mariadb stop

# fi

# /usr/bin/mysqld_safe --datadir='/var/lib/mysql' -u mysql
# ---------------------------------
#!/bin/sh

# if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
# then
# 	/etc/init.d/mariadb setup
# 	/etc/init.d/mariadb start

# 	mysql -u ${MYSQL_ROOT} < wp.sql
# 	rm wp.sql
# 	mysql -u ${MYSQL_ROOT} -e "CREATE USER '${DATABASE_USER}'@'localhost' IDENTIFIED BY '${DB_USER_PASS}';"
# 	mysql -u ${MYSQL_ROOT} -e "GRANT ALL PRIVILEGES ON *.* TO '${DATABASE_USER}'@'localhost' IDENTIFIED BY '${DB_USER_PASS}';"

# 	mysql -u ${MYSQL_ROOT} -e "CREATE USER '${DATABASE_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}';"
# 	mysql -u ${MYSQL_ROOT} -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${DATABASE_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}';"

# 	mysql -u ${MYSQL_ROOT} -e "ALTER USER '${DATABASE_USER}'@'localhost' IDENTIFIED BY '${DB_USER_PASS}';"
# 	mysql -u ${MYSQL_ROOT} -e "ALTER USER '${MYSQL_ROOT}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# 	sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
# fi
# rc-service mariadb start
# rc-service mariadb stop
# /usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid

# ---------------------------------

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

	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < /tmp/config

	echo
	echo 'MySQL init process done. Ready for start up.'
	echo
	echo "exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0" "$@"
fi

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@
