# **Kelompok IT08**

## Anggota

- Salsabila Amalia Harjanto (5027221023)
- Ditya Wahyu ()

## Laporan Resmi Modul 3

### Topologi


---
### Config
- Arakis (DHCP Relay)
  ```
  auto eth0
  iface eth0 inet dhcp
  
  auto eth1
  iface eth1 inet static
  	address 192.237.1.0
  	netmask 255.255.255.0
  
  auto eth2
  iface eth2 inet static
  	address 192.237.2.0
  	netmask 255.255.255.0
  
  auto eth3
  iface eth3 inet static
  	address 192.237.3.0
  	netmask 255.255.255.0
  
  auto eth4
  iface eth4 inet static
  	address 192.237.4.0
  	netmask 255.255.255.0
  ```
- Irulan (DNS Server)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.3.1
  	netmask 255.255.255.0
  	gateway 192.237.3.0
  ```
- Mohiam (DHCP Server)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.3.2
  	netmask 255.255.255.0
  	gateway 192.237.3.0
  ```
- Stilgar (Load Balancer)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.4.1
  	netmask 255.255.255.0
  	gateway 192.237.4.0
  ```
- Chani (Database Server)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.4.2
  	netmask 255.255.255.0
  	gateway 192.237.4.0
  ```
- Vladimir (PHP Worker)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.1.1
  	netmask 255.255.255.0
  	gateway 192.237.1.0
  ```
- Rabban (PHP Worker)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.1.2
  	netmask 255.255.255.0
  	gateway 192.237.1.0
  ```
- Feyd (PHP Worker)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.1.3
  	netmask 255.255.255.0
  	gateway 192.237.1.0
  ```
- Leto (Laravel Worker)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.2.1
  	netmask 255.255.255.0
  	gateway 192.237.2.0
  ```
- Duncan (Laravel Worker)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.2.2
  	netmask 255.255.255.0
  	gateway 192.237.2.0
  ```
- Jessica (Laravel Worker)
  ```
  auto eth0
  iface eth0 inet static
  	address 192.237.2.3
  	netmask 255.255.255.0
  	gateway 192.237.2.0
  ```
- Dmitri (Client Tetap)
  ```
  auto eth0
  iface eth0 inet dhcp
  hwaddress ether e2:27:eb:be:1b:07
  ```
- Paul (Client)
  ```
  auto eth0
  iface eth0 inet dhcp
  ```
---
### Setup awal
- Arakis (DHCP Relay)
  ```
  apt-get update
  apt-get install isc-dhcp-relay -y
  ```
- Irulan (DNS Server)
  ```
  echo 'nameserver 192.168.122.1' > /etc/resolv.conf
  apt-get update
  apt-get install bind9 -y
  ```
- Mohiam (DHCP Server)
  ```
  echo 'nameserver 192.237.3.1' > /etc/resolv.conf 
  apt-get update
  apt-get install isc-dhcp-server -y
  ```
- Stilgar (Load Balancer)
  ```
  echo 'nameserver 192.237.3.1' > /etc/resolv.conf 
  apt-get update
  apt-get install apache2-utils -y
  apt-get install nginx -y
  apt-get install lynx -y
  ```
- Chani (Database Server)
  ```
  echo 'nameserver 192.237.3.1' > /etc/resolv.conf 
  apt-get update
  apt-get install mariadb-server -y
  ```
- Vladimir, Rabban, Feyd (PHP Worker)
  ```
  echo 'nameserver 192.237.3.1' > /etc/resolv.conf
  apt-get update
  apt-get install nginx -y
  apt-get install wget -y
  apt-get install unzip -y
  apt-get install lynx -y
  apt-get install htop -y
  apt-get install apache2-utils -y
  apt-get install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip -y
  
  wget -O '/var/www/harkonen.it08.com' 'https://drive.usercontent.google.com/download?id=1lmnXJUbyx1JDt2OA5z_1dEowxozfkn30&export=download&authuser=0'
  ```
- Leto, Duncan, Jessica (Laravel Worker)
  ```
  echo 'nameserver 192.237.3.1' > /etc/resolv.conf 
  apt-get update
  apt-get install mariadb-client -y
  apt-get install lynx -y
  apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
  curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
  sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
  apt-get update
  apt-get install php8.0-mbstring php8.0-xml php8.0-cli php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl unzip wget -y
  apt-get install nginx -y
  wget https://getcomposer.org/download/2.0.13/composer.phar
  chmod +x composer.phar
  mv composer.phar /usr/bin/composer
  apt-get install git -y
  git clone https://github.com/martuafernando/laravel-praktikum-jarkom /var/www/laravel-praktikum-jarkom
  composer update
  composer install
  ```
- Dmitri, Paul (Client)
  ```
  echo 'nameserver 192.237.3.1' > /etc/resolv.conf 
  apt-get update
  apt-get install lynx -y
  apt-get install htop -y
  apt-get install apache2-utils -y
  apt-get install jq -y
  ```
---
### Soal 1
> Planet Caladan sedang mengalami krisis karena kehabisan spice, klan atreides berencana untuk melakukan eksplorasi ke planet arakis dipimpin oleh duke leto mereka meregister domain name atreides.yyy.com untuk worker Laravel mengarah pada Leto Atreides . Namun ternyata tidak hanya klan atreides yang berusaha melakukan eksplorasi, Klan harkonen sudah mendaftarkan domain name harkonen.yyy.com untuk worker PHP (0) mengarah pada Vladimir Harkonen.
> Lakukan konfigurasi sesuai dengan peta yang sudah diberikan.

Pertama, lakukan setup awal. Selanjutnya, menetapkan domain record untuk harkonen.it08.com ke php worker dan atreides.it08.com ke laravel worker, yang dalam pengerjaan ini domain tersebut mengarah ke IP worker 192.237.x.1.

**Script Irulan (DNS Server)**
```
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
@       IN    A    192.237.2.1
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
@       IN    A    192.237.1.1
"
echo "$harkonen" > /etc/bind/jarkom/harkonen.it08.com

service bind9 restart
```
---

### Soal 1
> Semua CLIENT harus menggunakan konfigurasi dari DHCP Server.

**Script Arakis (DHCP Relay)**
```
relay="SERVERS=\"192.237.3.2\" 
INTERFACES=\"eth1 eth2 eth3 eth4\"
OPTIONS=\"\"
"
echo "$relay" > /etc/default/isc-dhcp-relay

echo net.ipv4.ip_forward=1 > /etc/sysctl.conf

service isc-dhcp-relay restart
```
---

### Soal 2
> Client yang melalui House Harkonen mendapatkan range IP dari [prefix IP].1.14 - [prefix IP].1.28 dan [prefix IP].1.49 - [prefix IP].1.70.

**Script Mohiam (DHCP Server)**
```
subnet 192.237.1.0 netmask 255.255.255.0 {
    range 192.237.1.14 192.237.1.28;
    range 192.237.1.49 192.237.1.70;
    option routers 192.237.1.0;
}

subnet 192.237.2.0 netmask 255.255.255.0 {
}

subnet 192.237.3.0 netmask 255.255.255.0 {
}

subnet 192.237.4.0 netmask 255.255.255.0 {
}

echo "$subnet" > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
```
---

### Soal 3
> Client yang melalui House Atreides mendapatkan range IP dari [prefix IP].2.15 - [prefix IP].2.25 dan [prefix IP].2 .200 - [prefix IP].2.210.

**Script Mohiam (DHCP Server)**
```
subnet 192.237.1.0 netmask 255.255.255.0 {
    range 192.237.1.14 192.237.1.28;
    range 192.237.1.49 192.237.1.70;
    option routers 192.237.1.0;
}

subnet 192.237.2.0 netmask 255.255.255.0 {
    range 192.237.2.15 192.237.2.25;
    range 192.237.2.200 192.237.2.210;
    option routers 192.237.2.0;
}

subnet 192.237.3.0 netmask 255.255.255.0 {
}

subnet 192.237.4.0 netmask 255.255.255.0 {
}

echo "$subnet" > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
```
---

### Soal 4
> Client mendapatkan DNS dari Princess Irulan dan dapat terhubung dengan internet melalui DNS tersebut.

Ubah konfigurasi DHCP Server agar mengarah ke IP DNS Server (192.237.3.1).

**Script Mohiam (DHCP Server)**
```
subnet 192.237.1.0 netmask 255.255.255.0 {
    range 192.237.1.14 192.237.1.28;
    range 192.237.1.49 192.237.1.70;
    option routers 192.237.1.0;
    option broadcast-address 192.237.1.255;
    option domain-name-servers 192.237.3.1;
}

subnet 192.237.2.0 netmask 255.255.255.0 {
    range 192.237.2.15 192.237.2.25;
    range 192.237.2.200 192.237.2.210;
    option routers 192.237.2.0;
    option broadcast-address 192.237.2.255;
    option domain-name-servers 192.237.3.1;
}

subnet 192.237.3.0 netmask 255.255.255.0 {
}

subnet 192.237.4.0 netmask 255.255.255.0 {
}
```

Selanjutnya masukkan konfigurasi DNS Server pada Irulan.

**Script Irulan (DNS Server)**
```
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
```
---
### Soal 5
> Durasi DHCP server meminjamkan alamat IP kepada Client yang melalui House Harkonen selama 5 menit sedangkan pada client yang melalui House Atreides selama 20 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 87 menit.

**Script Mohiam (DHCP Server)**
```
subnet 192.237.1.0 netmask 255.255.255.0 {
    range 192.237.1.14 192.237.1.28;
    range 192.237.1.49 192.237.1.70;
    option routers 192.237.1.0;
    option broadcast-address 192.237.1.255;
    option domain-name-servers 192.237.3.1;
    default-lease-time 300;
    max-lease-time 5220;
}

subnet 192.237.2.0 netmask 255.255.255.0 {
    range 192.237.2.15 192.237.2.25;
    range 192.237.2.200 192.237.2.210;
    option routers 192.237.2.0;
    option broadcast-address 192.237.2.255;
    option domain-name-servers 192.237.3.1;
    default-lease-time 1200;
    max-lease-time 5220;
}

subnet 192.237.3.0 netmask 255.255.255.0 {
}

subnet 192.237.4.0 netmask 255.255.255.0 {
}
echo "$subnet" > /etc/dhcp/dhcpd.conf
```

**Result 1-5**

---






