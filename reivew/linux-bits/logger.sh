#!/bin/bash
. env.sh
logger -n "${SYSLOGHOST}" -u /tmp/ignored "[CCDC] ${HOSTNAME}" - $@
#on ubuntu 12.04 logger is broken.
#may also be able to use below for windows work
#echo -n "[CCDC] test message" | nc -4u -w1 ccdc.multifariousnonsense.com 514