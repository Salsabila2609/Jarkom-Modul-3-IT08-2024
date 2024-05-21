#!/bin/bash

echo 'nameserver 192.237.3.1' > /etc/resolv.conf
apt-get update
apt-get install mariadb-server -y
service mysql start

mysql -e "CREATE USER 'kelompokit08'@'%' IDENTIFIED BY 'passwordit08';"
mysql -e "CREATE USER 'kelompokit08'@'localhost' IDENTIFIED BY 'passwordit08';"
mysql -e "CREATE DATABASE dbkelompokit08;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'kelompokit08'@'%';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'kelompokit08'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

mysql="
[client-server]
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/
[mysqld]
skip-networking=0
skip-bind-address
"
echo "$mysql" > /etc/mysql/my.cnf

service mysql restart