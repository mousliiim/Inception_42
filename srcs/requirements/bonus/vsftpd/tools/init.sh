#!/bin/sh

adduser -D $FTP_USER && echo -n "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd;

delgroup www-data 2>>/dev/null;
delgroup -g 1000 2>>/dev/null;
addgroup -S -g 1000 www-data

adduser $FTP_USER www-data;

echo $FTP_USER > /etc/vsftpd/user_list;

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf