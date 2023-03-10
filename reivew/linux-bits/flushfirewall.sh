IPTABLES=$(type -p iptables)
IPTABLES -P INPUT ACCEPT
IPTABLES -P OUTPUT ACCEPT
IPTABLES -F


./logger.sh flushfirewall completed
