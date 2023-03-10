netsh advfirewall firewall set rule group="windows management instrumentation (wmi)" new enable=yes
netsh advfirewall firewall add rule dir=in name="DCOM" program=%systemroot%\system32\svchost.exe service=rpcss action=allow protocol=TCP localport=135
netsh advfirewall firewall add rule dir=in name ="WMI" program=%systemroot%\system32\svchost.exe service=winmgmt action = allow protocol=TCP localport=any
netsh advfirewall firewall add rule dir=in name ="UnsecApp" program=%systemroot%\system32\wbem\unsecapp.exe action=allow
net localgroup WinRMRemoteWMIUsers__ "Domain Users" /add
net localgroup "Distributed COM Users" "Domain Users" /add
net localgroup "Server Operators" "Domain Users" /add
net localgroup "Event Log Readers" "Domain Users" /add
net localgroup "Remote Management Users" "Domain Users" /add
net localgroup "Performance Monitor Users" "Domain Users" /add