# How to run Ansible
The plays are defined in ansible/playbooks. Then they are referenced in configure.yml, if you want to add new plays put them in the playbook dir and then add it to the configure.yml file

To run:
ansible-playbook -i inventory.yml confgiure.yml

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


# Windows
This folder is full of windows bits

# Persistence
This is a general linux based persistence

# funStuff is for troll scripts & 