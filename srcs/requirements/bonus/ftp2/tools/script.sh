#!/bin/sh

groupadd -g $GID $FTP_USER

# adduser -D -G $FTP_USER -h /home/$FTP_USER -s /bin/false -u $UID $FTP_USER
useradd -m -g $FTP_USER -d /home/$FTP_USER -u $UID $FTP_USER

# mkdir -p /home/$FTP_USER

chown -R $FTP_USER:$FTP_USER /home/$FTP_USER

echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

mkdir -p /var/run/vsftpd/empty

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

#!/bin/sh

# addgroup wpuad

# adduser --group wpuad -h /home/wpuad --shell /bin/false wpuad

# mkdir -p /home/wpuad

# chown -R wpuad:wpuad /home/wpuad

# echo "wpuad:wpuad" | /usr/sbin/chpasswd

# Create a new user for FTP server

# adduser --ingroup wpuad --disabled-password --shell /bin/false --gecos "" wpuad33
  
# adduser --gecos ${FTP_USER} && echo ${FTP_USER}:${FTP_PASS} | chpasswd

# # Change owner to home directory
# chown -R ${FTP_USER}:${FTP_USER} /home/"${FTP_USER}"

# echo "ftps is running..."

# Running This Command "/usr/sbin/vsftpd" make the service run in the foreground

# /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf