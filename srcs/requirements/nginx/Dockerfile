FROM alpine:3.15

COPY ./conf/nginx.conf /tmp
COPY ./conf/index.html /tmp
COPY ./conf/nginx-selfsigned.key /tmp
COPY ./conf/nginx-selfsigned.crt /tmp

RUN apk update && \
    apk add nginx openrc --no-cache && \
    adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.backup && \
    mv /tmp/nginx.conf /etc/nginx/nginx.conf && \
    mv /tmp/index.html /www/index.html && \
    mv /tmp/nginx-selfsigned.key /etc/nginx/nginx-selfsigned.key && \
    mv /tmp/nginx-selfsigned.crt /etc/nginx/nginx-selfsigned.crt

CMD ["nginx", "-g", "daemon off;"]
