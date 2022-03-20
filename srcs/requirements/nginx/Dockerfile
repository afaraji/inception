FROM alpine:3.15

RUN apk update && \
    apk add nginx openrc --no-cache && \
    adduser -u 82 -G www-data  -D www-data && \
    # adduser -D -g 'www' www && \
    mkdir /var/www/html && \
    chown -R www-data:www-data /var/lib/nginx && \
    chown -R www-data:www-data /var/www/html && \
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./conf/index.html /www/index.html
COPY ./conf/nginx-selfsigned.key /etc/nginx/nginx-selfsigned.key
COPY ./conf/nginx-selfsigned.crt /etc/nginx/nginx-selfsigned.crt

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
