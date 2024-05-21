#!/bin/bash

echo 'nameserver 192.237.3.1' > /etc/resolv.conf
apt-get update
apt-get install apache2-utils -y
apt-get install nginx -y
apt-get install lynx -y

service nginx start

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php
mkdir /etc/nginx/supersecret
htpasswd -c /etc/nginx/supersecret/htpasswd secmart
#kcksit08

echo ' upstream worker {
#    hash $request_uri consistent;
#    least_conn;
#    ip_hash;
server 192.237.1.1;
server 192.237.1.2;
server 192.237.1.3;
}

server {
listen 80;
server_name harkonen.it08.com www.harkonen.it08.com;

root /var/www/html;

index index.html index.htm index.nginx-debian.html;

server_name _;

location / {
allow 192.237.1.37;
allow 192.237.1.67;
allow 192.237.2.203;
allow 192.237.2.207;
deny all;
proxy_pass http://worker;

       auth_basic "Restricted Content";
       auth_basic_user_file /etc/nginx/supersecret/htpasswd;
}
location ~ /dune {
proxy_pass https://www.dunemovie.com.au;
proxy_set_header Host www.dunemovie.com.au;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
}
} ' > /etc/nginx/sites-available/lb_php

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
rm /etc/nginx/sites-enabled/default
fi

service nginx restart


# Laravel Worker
echo 'upstream laravel_worker { #(round-robin(default), ip_hash, least_conn, hash $request_uri consistent)
least_conn;
server 192.237.2.1:8001;
server 192.237.2.2:8002;
server 192.237.2.3:8003;
}

server {
listen 80;
server_name atreides.it08.com www.atreides.it08.com;

location / {
proxy_pass http://laravel_worker;
}
}
' > /etc/nginx/sites-available/laravel-fff

ln -s /etc/nginx/sites-available/laravel-fff /etc/nginx/sites-enabled/

service nginx restart