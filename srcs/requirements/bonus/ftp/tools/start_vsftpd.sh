#!/bin/sh

# groupadd -g $GID $FTP_USER
addgroup -g $GID $FTP_USER

# useradd -m -g $FTP_USER -d /home/$FTP_USER -u $UID $FTP_USER
adduser -D -G $FTP_USER -h /home/$FTP_USER -s /bin/false -u $UID $FTP_USER

mkdir -p $FTP_ROOT

chown -R $FTP_USER:$FTP_USER $FTP_ROOT

echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

mkdir -p /var/run/vsftpd/empty

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf