FROM alpine:3.15

RUN	apk update && apk add --no-cache redis \
	&& cp /etc/redis.conf /etc/redis.conf.backup

COPY conf/redis.conf /etc/redis.conf

CMD [ "redis-server", "--protected-mode no" ]
