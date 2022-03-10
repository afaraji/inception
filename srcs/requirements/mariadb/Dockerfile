FROM alpine:3.15

COPY source dest

RUN apk update && apk upgrade && apk add --no-cache \
    mariadb mariadb-client


CMD ["nginx", "-g", "daemon off;"]
