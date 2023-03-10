#!/bin/bash

. env.sh

#if not root quit and message that need root
if [ "$EUID" -ne 0 ]; then
  ./logger.sh adduser_simple.sh needs to run as root
  >&2 echo "adduser_simple.sh needs to run as root"
  exit
else
  >&2 echo "Running as root"
  adduser -m simple
  echo "${TEAMPASSWD}" | passwd --stdin simple
  mkdir ~simple/.ssh/
  touch ~simple/.ssh/authorized_keys
  chmod go-rwx ~simple.ssh/authorized_keys
  echo "${SSHPUBKEY}" >> ~simple/.ssh/authorized_keys
  exit
fi

./logger.sh adduser_simple.sh completed
