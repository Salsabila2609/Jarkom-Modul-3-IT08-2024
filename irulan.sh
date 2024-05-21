#!/bin/bash

echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install bind9 -y

forward="options {
directory \"/var/cache/bind\";
forwarders {
  	   192.168.122.1;
};

allow-query{any;};
listen-on-v6 { any; };
};
"
echo "$forward" > /etc/bind/named.conf.options

echo "zone \"atreides.it08.com\" {
	type master;
	file \"/etc/bind/jarkom/atreides.it08.com\";
};

zone \"harkonen.it08.com\" {
	type master;
	file \"/etc/bind/jarkom/harkonen.it08.com\";
};
" > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom

atreides="
;
;BIND data file for local loopback interface
;
\$TTL    604800
@    IN    SOA    atreides.it08.com. root.atreides.it08.com. (
        2        ; Serial
                604800        ; Refresh
                86400        ; Retry
                2419200        ; Expire
                604800 )    ; Negative Cache TTL
;                   
@    IN    NS    atreides.it08.com.
@       IN    A    192.237.4.1
"
echo "$atreides" > /etc/bind/jarkom/atreides.it08.com

harkonen="
;
;BIND data file for local loopback interface
;
\$TTL    604800
@    IN    SOA    harkonen.it08.com. root.harkonen.it08.com. (
        2        ; Serial
                604800        ; Refresh
                86400        ; Retry
                2419200        ; Expire
                604800 )    ; Negative Cache TTL
;                   
@    IN    NS    harkonen.it08.com.
@       IN    A    192.237.4.1
"
echo "$harkonen" > /etc/bind/jarkom/harkonen.it08.com

service bind9 restart