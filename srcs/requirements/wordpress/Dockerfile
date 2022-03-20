FROM alpine:3.15

# wordpress installation

RUN apk add wget lighttpd php7-common php7-session php7-iconv php7-json php7-gd \
	php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
	php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
	php7-ldap php7-ctype php7-dom php7-simplexml php7 php7-fpm php7-opcache \
	php7-mbstring php7-zlib php7-redis

# RUN mkdir -p /var/www/html && cd /var/www/html && \
# 	wget http://wordpress.org/latest.tar.gz && \
# 	tar -xzvf latest.tar.gz && \
# 	rm -rf latest.tar.gz &&
RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xvf /latest.tar.gz && rm -rf /latest.tar.gz \
	&& mkdir -p /var/www/ && mv wordpress/ /var/www/html

#
# configure wordpress
#
COPY /conf/wp-config.php /var/www/html/

RUN adduser -u 82 -G www-data  -D www-data

RUN chown -R www-data:www-data /var/www/html/ \
&& chmod -R 775 /var/www/html/

COPY /conf/www.conf /etc/php7/php-fpm.d/

EXPOSE 9000

# -F = --nodaemonize
CMD [ "php-fpm7", "-F" ]

# FROM alpine:3.15

# EXPOSE 80
# EXPOSE 9000

# RUN apk update && \
# 	apk add nginx && \
#     apk add php-fpm

# ADD https://github.com/WordPress/WordPress /var/www/localhost/htdocs
# ADD conf/default.conf /etc/nginx/http.d/default.conf
# ADD conf/wp-config.php /wp-config.php

# CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]

# WORKDIR /var/www/localhost/htdocs
