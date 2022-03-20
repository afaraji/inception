FROM alpine:3.15

COPY ./tools/script.sh script.sh
# COPY ./conf/wordpress.sql wordpress.sql

RUN apk add --no-cache mariadb mariadb-client openrc
RUN openrc
RUN touch /run/openrc/softlevel

EXPOSE 3306

CMD ["sh", "script.sh"]

# CMD ["/usr/bin/mysqld_safe", "-u", "root"]

# # MariaDB server and client
# RUN apk update && apk add mariadb mariadb-client
# # this is not executed by mariadb package
# RUN mysql_install_db --user=mysql

# # make life easier
# ENV TERM xterm

# # import files into container
# COPY conf/mariadb_conf.cnf /etc/mysql/mariadb_conf.cnf
# COPY tools/script.sh script.sh
# #COPY scripts/* /opt/mysql/

# # last optimizations are done against the running daemon via SQL
# #RUN /opt/mysql/prepare-db

# # other applications need to backup/analyze data and logs
# # VOLUME /var/lib/mysql
# # VOLUME /var/log/mysql

# # create and make available a directory for backups
# # RUN mkdir -p /var/backups/mysql
# # RUN chmod a+r /var/backups/mysql/
# # VOLUME /var/backups/mysql

# # CMD ["sh", "script.sh"]

# # demonize
# ENTRYPOINT ["mysqld_safe"]

# # MariaDB port
# EXPOSE 3306

# /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
