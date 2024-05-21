#!/bin/bash

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.237.0.0/16
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay start

relay="SERVERS=\"192.237.3.2\" 
INTERFACES=\"eth1 eth2 eth3 eth4\"
OPTIONS=\"\"
"
echo "$relay" > /etc/default/isc-dhcp-relay

echo net.ipv4.ip_forward=1 > /etc/sysctl.conf

service isc-dhcp-relay restart