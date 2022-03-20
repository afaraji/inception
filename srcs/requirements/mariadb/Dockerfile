FROM alpine:3.15

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils pwgen && \
    rm -f /var/cache/apk/*

COPY tools/run.sh /scripts/run.sh
COPY conf /config

EXPOSE 3306

#VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/scripts/run.sh"]
