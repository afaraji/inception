FROM alpine:3.15

RUN apk add --no-cache wget php7-common php7-iconv php7-json php7-gd php7-curl \
	php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
	php7-ctype php7-dom php7 php7-fpm php7-opcache php7-session

WORKDIR /var/www/html

COPY /html /var/www/html

RUN delgroup www-data; \
	addgroup -S -g 82 www-data && adduser -S -u 82 -G www-data www-data && \
	chown -R www-data:www-data /var/www/html/

EXPOSE 1337

CMD ["php", "-S", "0.0.0.0:1337"]
