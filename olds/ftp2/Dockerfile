FROM debian:buster

RUN apt-get -y update && apt-get install -y vsftpd

COPY tools/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY tools/script.sh /

RUN chmod +x script.sh

EXPOSE 20 21 40000-40010

CMD ["./script.sh"]