#!/bin/bash

apt-get update
apt-get install lynx -y
apt-get install htop -y
apt-get install apache2-utils -y
apt-get install jq -y

config="auto eth0
iface eth0 inet dhcp
hwaddress ether e2:27:eb:be:1b:07
"
echo "$config" > /etc/network/interfaces

echo '
{
  "username": "kelompokit08",
  "password": "passwordit08"
}
' > register.json

echo '
{
  "username": "kelompokit08",
  "password": "passwordit08"
}' > login.json