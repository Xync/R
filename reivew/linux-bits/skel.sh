#!/bin/bash

. env.sh

#Your plugin goes here.  Preferably silent.  Ideally test if successful and syslog accordingly.
#example of how env variables are used
#echo $SYSLOGHOST

./logger.sh skel completed successfuly.
