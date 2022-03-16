FROM alpine:3.15

COPY source dest

RUN apk add --no-cache mariadb mariadb-client


EXPOSE 3306

CMD ["sh", "script.sh"]



