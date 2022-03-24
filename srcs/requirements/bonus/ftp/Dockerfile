# FROM alpine:3.15

# RUN	apk update && apk add --no-cache vsftpd && mkdir -p /var/www/html

# RUN adduser wordpress --disabled-password
# RUN echo "wordpress:password" | /usr/sbin/chpasswd && \
# 	echo wordpress | tee -a /etc/vsftpd/vsftpd.userlist

# # COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

# EXPOSE 21 21000-21010

# # CMD [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]
# CMD [ "vsftpd"]

FROM alpine:3.15
RUN apk --no-cache add vsftpd

COPY tools/start_vsftpd.sh /bin/start_vsftpd.sh
COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 20 21 40000-40010

CMD ["/bin/start_vsftpd.sh"]