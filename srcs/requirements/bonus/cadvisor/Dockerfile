FROM alpine:3.15


RUN set -xe \
    && apk add --no-cache ca-certificates openssl device-mapper zfs wget \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-bin-2.23-r3.apk \
    && apk add --allow-untrusted glibc-2.23-r3.apk glibc-bin-2.23-r3.apk \
    && rm -rf *.apk

RUN set -xe \
    && wget https://github.com/google/cadvisor/releases/download/v0.23.4/cadvisor -O /usr/bin/cadvisor \
    && chmod +x /usr/bin/cadvisor

EXPOSE 8080

ENTRYPOINT ["cadvisor", "-logtostderr"]
