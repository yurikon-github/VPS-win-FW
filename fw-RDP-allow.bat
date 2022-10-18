netsh advfirewall firewall set rule group="Удаленный рабочий стол - RemoteFX"					new enable=no
netsh advfirewall firewall set rule name="Удаленный рабочий стол - RemoteFX (TCP - входящий)"       		new enable=no
netsh advfirewall firewall set rule name="Дистанционное управление рабочим столом (TCP - входящий)"        	new enable=no
netsh advfirewall firewall set rule name="Remote Desktop - RemoteFX (UDP-In)"					new enable=no

netsh advfirewall firewall delete rule name="Remote Desktop - User Mode (TCP-In)"
netsh advfirewall firewall delete rule name="Remote Desktop - User Mode (UDP-In)"

::------
netsh advfirewall firewall delete rule name="(Y) RDP Block from LocalSubnet (TCP-In)"
netsh advfirewall firewall delete rule name="(Y) RDP Block from LocalSubnet (UDP-In)"

netsh advfirewall firewall add rule name="(Y) RDP Block from LocalSubnet (TCP-In)" localport=3389 protocol=tcp remoteip=LocalSubnet dir=in action=block enable=yes profile=private,domain,public description="(Y) Inbound BLOCK RDP-tcp for LocalSubnet" 
netsh advfirewall firewall add rule name="(Y) RDP Block from LocalSubnet (UDP-In)" localport=3389 protocol=udp remoteip=LocalSubnet dir=in action=block enable=yes profile=private,domain,public description="(Y) Inbound BLOCK RDP-udp for LocalSubnet" 

::------
netsh advfirewall firewall delete rule name="(Y) RDP Block from 192.168.0.0 (TCP-In)"
netsh advfirewall firewall delete rule name="(Y) RDP Block from 192.168.0.0 (UDP-In)"

netsh advfirewall firewall add rule name="(Y) RDP Block from 192.168.0.0 (TCP-In)" localport=3389 protocol=tcp remoteip=192.168.0.0/16 dir=in action=block enable=yes profile=private,domain,public description="(Y) Inbound BLOCK RDP-tcp for 192.168.0.0/16" 
netsh advfirewall firewall add rule name="(Y) RDP Block from 192.168.0.0 (UDP-In)" localport=3389 protocol=udp remoteip=192.168.0.0/16 dir=in action=block enable=yes profile=private,domain,public description="(Y) Inbound BLOCK RDP-udp for 192.168.0.0/16" 

::------
netsh advfirewall firewall delete rule name="(Y) RDP Allow (TCP-In)" 
netsh advfirewall firewall delete rule name="(Y) RDP Allow (UDP-In)"

netsh advfirewall firewall add rule name="(Y) RDP Allow (TCP-In)" localport=3389 protocol=tcp dir=in action=allow enable=yes profile=private,domain,public program="%%SystemRoot%%\system32\svchost.exe" service="TermService" description="(Y) Inbound rule for the Remote Desktop service to allow RDP traffic. [TCP 3389]" 
netsh advfirewall firewall add rule name="(Y) RDP Allow (UDP-In)" localport=3389 protocol=udp dir=in action=allow enable=yes profile=private,domain,public program="%%SystemRoot%%\system32\svchost.exe" service="TermService" description="(Y) Inbound rule for the Remote Desktop service to allow RDP traffic. [UDP 3389]" 

