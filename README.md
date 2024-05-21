# **Kelompok IT08**

## Anggota

- Salsabila Amalia Harjanto (5027221023)
- Ditya Wahyu ()

## Laporan Resmi Modul 3

### Topologi

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/0c4c27c9-49e8-47ed-8f20-cd43aa7cb738)

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
Gunakan `ping harkonen.it08.com` dan `atreides.it08.com` untuk pengecekan domain di client.

**Result 1-5**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/b4bf9dba-faaf-402d-8134-9b07017b0e17)

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/e09181ee-cd7e-4d93-8d86-91fa97eebf94)

---
### Soal 6
> Vladimir Harkonen memerintahkan setiap worker(harkonen) PHP, untuk melakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3.

**Script Vladimir, Rabban, Feyd (PHP Worker)**
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

service nginx start
service php7.3-fpm start

wget -O '/var/www/harkonen.it08.com' 'https://drive.usercontent.google.com/download?id=1lmnXJUbyx1JDt2OA5z_1dEowxozfkn30&export=download&authuser=0'
unzip -o /var/www/harkonen.it08.com -d /var/www/
rm /var/www/harkonen.it08.com
mv /var/www/modul-3 /var/www/harkonen.it08.com

source /root/script.sh
```
**Script /root/script.sh**
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/harkonen.it08.com
ln -s /etc/nginx/sites-available/harkonen.it08.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

echo 'server {
     listen 80;
     server_name _;

     root /var/www/harkonen.it08.com;
     index index.php index.html index.htm;

     location / {
         try_files $uri $uri/ /index.php?$query_string;
     }

     location ~ \.php$ {
         include snippets/fastcgi-php.conf;
         fastcgi_pass unix:/run/php/php7.3-fpm.sock;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
         include fastcgi_params;
     }
 }' > /etc/nginx/sites-available/harkonen.it08.com

 service nginx restart
```
Gunakan `lynx localhost` untuk memeriksa deployment pada worker.

**Result**

Vladimir

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/a0ec390d-238a-4021-a811-e6577065bb9b)

Rabban

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/4714a588-44a6-4569-b3dc-2dcd8355694b)

Feyd

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/3ec5a252-7b9f-4ec8-b8ac-0e32f41b2bb4)

---
### Nomor 7
> Aturlah agar Stilgar dari fremen dapat dapat bekerja sama dengan maksimal, lalu lakukan testing dengan 5000 request dan 150 request/second.

Pertama, arahkan domain pada DNS Server ke Load Balancer.

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
@       IN    A    192.237.4.1
"
echo "$atreides" > /etc/bind/jarkom/atreides.it08.com
```

Selanjutnya atur konfigurasi pada load balancer.

**Script Stilgar (Load Balancer)**
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo '
    upstream worker {
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

        proxy_pass http://worker;
    }

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```
Gunakan `ab -n 5000 -c 150 http://harkonen.it08.com/` untuk testing.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/15573312-20b0-4013-977d-000dea366577)

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/806dd2f4-9272-4f15-8f03-b20e4a6006fe)

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/a4177444-2d4e-4017-9e95-6371f1ba6591)

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/002ef66e-7408-46e2-aafa-d7335d9f70c7)

---
### Nomor 8
> Karena diminta untuk menuliskan peta tercepat menuju spice, buatlah analisis hasil testing dengan 500 request dan 50 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut:
> a. Nama Algoritma Load Balancer
> b. Report hasil testing pada Apache Benchmark
> c. Grafik request per second untuk masing masing algoritma. 
> d. Analisis

Scriptnya sama dengan script load balancer di nomor 7, namun menggunakan algoritma yang berbeda-beda.
Untuk setiap algoritma, Gunakan command `ab -n 500 -c 50 http://harkonen.it08.com/` untuk testing.

**Round-robin**
```
upstream worker {
server 192.237.1.1;
server 192.237.1.2;
server 192.237.1.3;
}
```

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/b185d2b5-ca71-4d2a-be80-fb4619240263)

**Generic hash**
```
upstream worker {
hash $request_uri consistent;
server 192.237.1.1;
server 192.237.1.2;
server 192.237.1.3;
}
```

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/b40bf4d5-aa99-47f2-a7bc-61fcb295e8ad)

**Least Connection**
```
upstream worker {
least_conn;
server 192.237.1.1;
server 192.237.1.2;
server 192.237.1.3;
}
```

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/41f6da26-3ab9-4780-84a5-a20fe328a562)

**IP hash**
```
upstream worker {
ip_hash;
server 192.237.1.1;
server 192.237.1.2;
server 192.237.1.3;
}
```

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/75e2740f-7e73-4adf-8926-1d9e36004891)

**Grafik**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/4ac1ca04-5876-4b42-822e-acc1b3141fd4)

**Kesimpulan**

Berdasarkan hasil RPS, algoritma Least Connection menunjukkan performa terbaik dengan RPS sebesar 861.23, diikuti oleh IP Hash (815.64), Generic Hash (768.61), dan Round Robin (631.73). Least Connection unggul karena mendistribusikan permintaan ke server dengan koneksi aktif paling sedikit, memastikan beban kerja terdistribusi lebih merata dan optimal, sehingga meningkatkan responsivitas dan kecepatan layanan. Algoritma ini sangat efektif dalam lingkungan dengan beban kerja yang bervariasi, meskipun membutuhkan pemantauan aktif terhadap jumlah koneksi.

---
### Nomor 9
> Dengan menggunakan algoritma Least-Connection, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 1000 request dengan 10 request/second, kemudian tambahkan grafiknya pada peta.

Scriptnya sama dengan script load balancer di nomor 7, namun menggunakan jumlah workernya yang berbeda-beda.
Untuk setiap algoritma, Gunakan command `ab -n 1000 -c 10 http://harkonen.it08.com/` untuk testing.

**3 Worker**
```
upstream worker {
server 192.237.1.1;
server 192.237.1.2;
server 192.237.1.3;
}
```
**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/b733b425-4e4a-46f8-8338-fb7f74cae2eb)

**2 Worker**
```
upstream worker {
server 192.237.1.1;
server 192.237.1.2;
}
```
**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/a5c0ac15-5c6d-4339-a899-3bdbc6d3170d)

**1 Worker**
```
upstream worker {
server 192.237.1.1;
}
```
**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/b90e4216-628b-4f43-9192-9a4c7df30eab)

**Grafik**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/a887ee6c-fd55-43ec-8048-91fc7d5b6c7b)

**Kesimpulan**

Dalam konteks pengujian ini, didapatkan bahwa bahwa performa RPS tertinggi dicapai saat hanya menggunakan 1 worker dengan RPS sebesar 854.39. Ketika jumlah worker ditingkatkan menjadi 2 dan 3, RPS menurun masing-masing menjadi 732.43 dan 681.23. Hal ini dapat terjadi karena semakin sedikit jumlah worker, semakin sedikit juga beban kerja yang harus ditangani oleh masing-masing worker, sehingga dapat meningkatkan kecepatan request per second yang dihasilkan. Selain itu, mengurangi jumlah worker justru meningkatkan efisiensi dalam hal RPS, yang mungkin diakibatkan oleh pengurangan overhead komunikasi antar worker.

---
### Nomor 10
> Selanjutnya coba tambahkan keamanan dengan konfigurasi autentikasi di LB dengan dengan kombinasi username: “secmart” dan password: “kcksyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/supersecret/.

**Script Stilgar (Load Balancer)**
```
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
} ' > /etc/nginx/sites-available/lb_php

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```

Gunakan `lynx http://harkonen.it08.com/` di client.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/2a7a7526-a5f6-45eb-926d-7c8173a0832d)

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/f4e3e990-98ed-4712-bd77-4022e6bb2e18)

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/6a81b0e9-8499-481d-923a-ba48eb092c4e)

---
### Nomor 11
> Lalu buat untuk setiap request yang mengandung /dune akan di proxy passing menuju halaman https://www.dunemovie.com.au/.

**Script Stilgar (Load Balancer)**
```
echo ' 
location ~ /dune {
proxy_pass https://www.dunemovie.com.au;
proxy_set_header Host www.dunemovie.com.au;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
}
} ' >> /etc/nginx/sites-available/lb_php

service nginx restart
```
Gunakan `lynx http://harkonen.it08.com/dune` di client.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/db58eb36-866e-4018-a18c-d17419866a74)

---
### Nomor 12
> Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].1.37, [Prefix IP].1.67, [Prefix IP].2.203, dan [Prefix IP].2.207.

Tambahkan location yang berisi IP yang diallow di Load Balancer untuk memberikan izin.

**Script Stilgar (Load Balancer)**
```
echo '
location / {
allow 192.237.1.37;
allow 192.237.1.67;
allow 192.237.2.203;
allow 192.237.2.207;
deny all;
proxy_pass http://worker;
} ' >> /etc/nginx/sites-available/lb_php
```
Kemudian tentukan client yang memiliki fixed address, yang dalam pengerjaan ini adalah Dmitri. 

**Script Mohiam (DHCP Server)**
```
echo '
host Dimitri {
    hardware ethernet e2:27:eb:be:1b:07;
    fixed-address 192.237.1.37;
} ' > /etc/dhcp/dhcpd.conf
```
- e2:27:eb:be:1b:07 didapatkan dari node client (Dmitri) dengan menggunakan ip a lalu periksa yang terhubung dengan DHCP Relay (Arakis) yaitu eth0.
- 192.237.1.37 merupakan fixed address untuk client yang diizinkan mengakses domain pada soal.

**Script Dmitri (Client)**
```
config="auto eth0
iface eth0 inet dhcp
hwaddress ether e2:27:eb:be:1b:07
"
echo "$config" > /etc/network/interfaces
```

Gunakan `lynx http://harkonen.it08.com/` untuk melihat hasilnya.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/fbda7291-78fd-40ea-b8a9-1dfeb71c2b90)

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/c2afccb9-6f1f-4735-bf8c-ea447ad771b2)

---
### Nomor 13
> Tidak mau kalah dalam perburuan spice, House atreides juga mengatur para pekerja di atreides.yyy.com. Semua data yang diperlukan, diatur pada Chani dan harus dapat diakses oleh Leto, Duncan, dan Jessica.

**Script Chani (Database Server)**
```
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
```
Gunakan `mariadb --host=192.237.4.2 --port=3306 --user=kelompokit08 --password=passwordit08` pada setiap worker laravel untuk mengakses database.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/2461395f-ed54-4737-aa5a-d6df855eacbb)

---
### Nomor 14
> Leto, Duncan, dan Jessica memiliki atreides Channel sesuai dengan quest guide berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer.

**Script Leto, Duncan, Jessica (Laravel Worker)**
```
echo 'APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=192.237.4.2
DB_PORT=3306
DB_DATABASE=dbkelompokit08
DB_USERNAME=kelompokit08
DB_PASSWORD=passwordit08

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
VITE_PUSHER_HOST="${PUSHER_HOST}"
VITE_PUSHER_PORT="${PUSHER_PORT}"
VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"
' > /var/www/laravel-praktikum-jarkom/.env

service nginx start
cd /var/www/laravel-praktikum-jarkom
composer update
composer install
service nginx start
php artisan migrate:fresh
php artisan db:seed --class=AiringsTableSeeder
php artisan key:generate
php artisan config:cache
php artisan migrate
php artisan db:seed
php artisan storage:link
php artisan jwt:secret
php artisan config:clear
chown -R www-data.www-data /var/www/laravel-praktikum-jarkom/storage

echo 'server {

    listen 8001/8002/8003;
    # sesuaikan port dengan worker

    root /var/www/laravel-praktikum-jarkom/public;

    index index.php index.html index.htm;
    server_name _;

    location / {
            try_files $uri $uri/ /index.php?$query_string;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
    }

location ~ /\.ht {
            deny all;
    }

    error_log /var/log/nginx/fff_error.log;
    access_log /var/log/nginx/fff_access.log;
}
' > /etc/nginx/sites-available/fff

ln -s /etc/nginx/sites-available/fff /etc/nginx/sites-enabled/
chown -R www-data.www-data /var/www/laravel-praktikum-jarkom/storage
service php8.0-fpm start
service nginx restart
```
Cek isi tabel dan data pada database.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/7ca8adba-33c9-4ec1-a109-1a58701a1033)

Cek deployment pada setiap worker laravel menggunakan `lynx localhost:8001/8002/8003`.

**Result**

Leto

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/f0f96803-85b5-4da1-a027-611ae95164a3)

Duncan

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/e968379e-11d8-47e5-ab3d-e5c68e57c7f3)

Jessica

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/daebba18-0507-440f-80fc-19e7132e2038)


---
### Nomor 15
> atreides Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada peta.
> a. POST /auth/register

Buat file register.json.

**Script Dmitri (Client)**
```
echo '
{
  "username": "kelompokit08",
  "password": "passwordit08"
}
' > register.json
```

Gunakan `ab -n 100 -c 10 -p register.json -T application/json http://192.237.2.1:8001/api/auth/register` untuk melakukan testing.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/33b21904-b11e-47b1-b792-e3d836d14409)

**Kesimpulan**

Testing ini menunjukkan bahwa server mengalami masalah signifikan dalam menangani permintaan POST /auth/register, terutama disebabkan oleh penggunaan username yang sama untuk setiap permintaan, menyebabkan 99 dari 100 permintaan gagal. RPS yang rendah dan waktu respon yang sangat tinggi menandakan bahwa server tidak dapat menangani beban ini dengan efisien.

---
### Nomor 16
> b. POST /auth/login

Buat file login.json.

**Script Dmitri (Client)**
```
echo '
{
  "username": "kelompokit08",
  "password": "passwordit08"
}' > login.json
```

Gunakan `ab -n 100 -c 10 -p login.json -T application/json http://192.237.2.1:8001/api/auth/login` untuk melakukan testing.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/b4b334d2-60dd-4497-87c8-f6a1aab5c2ee)

**Kesimpulan**

Testing ini menunjukkan bahwa server mengalami masalah dalam menangani permintaan POST /auth/login, dengan 27 dari 100 permintaan gagal. RPS yang rendah (2.17) dan waktu respon yang sangat tinggi (4.6 detik) menandakan bahwa server tidak dapat menangani beban ini dengan efisien.

---
### Nomor 17
> c. GET /me

Jalankan command berikut

```
curl -X POST -H "Content-Type: application/json" -d @login.json http://192.237.2.1:8001/api/auth/login > login_output.txt
token=$(cat login_output.txt | jq -r '.token')
````

Gunakan `ab -n 100 -c 10 -H "Authorization: Bearer $token" http://192.237.2.1:8001/api/me` untuk testing.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/030b7555-2f23-4958-bf66-0c611113556f)

**Kesimpulan**

Testing ini menunjukkan bahwa server mengalami masalah dalam menangani permintaan GET /me, dengan 63 dari 100 permintaan gagal. Namun, terlihat ada peningkatan RPS dan time per request yang lebih baik dibanding sebelumnya. Menunjukan bahwa server dapat menangani permintaan ini dengan lebih baik.

---
### Nomor 18
> Untuk memastikan ketiganya bekerja sama secara adil untuk mengatur atreides Channel maka implementasikan Proxy Bind pada Stilgar untuk mengaitkan IP dari Leto, Duncan, dan Jessica.

**Script Stilgar (Load Balancer)**
```
echo 'upstream laravel_worker {
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
```

Gunakan `ab -n 100 -c 10 -p login.json -T application/json http://atreides.it08.com/api/auth/login` untuk testing.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/e5ce8d12-6e7b-4909-82b5-85d793ef24b1)

Leto

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/3ce6546a-c04e-4155-b63a-34d8bc1ef001)

Duncan

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/45f73aa0-0196-4906-affa-4a09655ad3e0)

Jessica

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/ae7cc24d-b183-4a1b-9cbe-029f5a1d0726)

---
### Nomor 19
> Untuk meningkatkan performa dari Worker, coba implementasikan PHP-FPM pada Leto, Duncan, dan Jessica. Untuk testing kinerja naikkan 
> - pm.max_children
> - pm.start_servers
> - pm.min_spare_servers
> - pm.max_spare_servers
> sebanyak tiga percobaan dan lakukan testing sebanyak 100 request dengan 10 request/second kemudian berikan hasil analisisnya pada PDF.

Buat 3 script testing.

**Script test1.sh**
```
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 10
pm.start_servers = 4
pm.min_spare_servers = 2
pm.max_spare_servers = 6' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/fe84ddc9-2998-4e3c-afce-d27297286442)

**Script test2.sh**
```
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 30
pm.start_servers = 10
pm.min_spare_servers = 5
pm.max_spare_servers = 18' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/67af639d-5cc1-4a00-98e0-a1d183056020)

**Script test3.sh**
```
echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 50
pm.start_servers = 14
pm.min_spare_servers = 8
pm.max_spare_servers = 25' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

Gunakan `ab -n 100 -c 10 -p login.json -T application/json http://atreides.it08.com/api/auth/login` untuk testing.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/d2bf1c61-55dd-4cbf-933e-0bb6aa5a9091)

**Kesimpulan**

Hasil analisis menunjukkan bahwa perbedaan waktu request per second pada setiap percobaan tidak begitu signifikan. Ini bisa disebabkan oleh kualitas server yang tidak merespons secara berarti ketika diberikan beberapa konfigurasi yang tidak sesuai dengan performanya. Beberapa faktor yang dapat menjelaskan fenomena ini meliputi kapasitas sumber daya terbatas, di mana server atau node pekerja memiliki keterbatasan dalam kapasitas sumber daya. Dalam kondisi seperti ini, peningkatan konfigurasi seperti pm.max_children, pm.start_servers, dan lainnya mungkin tidak memiliki dampak yang mencolok karena sudah mencapai batas kapasitas fisik atau sumber daya yang tersedia.

---
### Nomor 20
> Nampaknya hanya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa dari worker maka implementasikan Least-Conn pada Stilgar. Untuk testing kinerja dari worker tersebut dilakukan sebanyak 100 request dengan 10 request/second.

**Script Stilgar (Load Balancer)**
```
echo 'upstream laravel_worker {
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
```

Gunakan `ab -n 100 -c 10 -p login.json -T application/json http://atreides.it08.com/api/auth/login` untuk testing.

**Result**

![image](https://github.com/Salsabila2609/Jarkom-Modul-3-IT08-2024/assets/128382995/03d5eac9-31f7-4b51-93ec-5ba7126d7087)

**Kesimpulan**

Penggunaan algoritma least connection membantu meningkatkan kinerja worker, terlihat dari kenaikan RPS yang cukup signifikan dan time per request yang lebih baik daripada sebelumnya.

---

























