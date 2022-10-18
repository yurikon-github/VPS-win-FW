netsh advfirewall firewall delete rule name="(Y) ICMP Allow incoming V4 echo request"
netsh advfirewall firewall delete rule name="(Y) All ICMP V4"
netsh advfirewall firewall delete rule name="(Y) Block Type 13 ICMP V4"

netsh advfirewall firewall add rule name="(Y) ICMP Allow incoming V4 echo request" protocol=icmpv4:8,any   dir=in action=allow enable=yes description="Allow ping requests"
netsh advfirewall firewall add rule name="(Y) All ICMP V4"                         protocol=icmpv4:any,any dir=in action=allow enable=yes description="Allow ping requests"
netsh advfirewall firewall add rule name="(Y) Block Type 13 ICMP V4"               protocol=icmpv4:13,any  dir=in action=block enable=yes description="Allow ping requests"


::"%SystemRoot%\system32\netsh.exe" 
::advfirewall 
::firewall 
::add 
::rule name="Remote Desktop - User Mode (TCP-In)" 
::dir=in 
::action=allow 
::program="%%SystemRoot%%\system32\svchost.exe" 
::service="TermService" 
::description="Inbound rule for the Remote Desktop service to allow RDP traffic. [TCP 3389]" 
::enable=yes 
::profile=private,domain,public 
::localport=3389 
::protocol=tcp

::netsh advfirewall firewall add rule name="(Y) ICMP Allow incoming V4 echo request" protocol=icmpv4:any,any	remoteip=LocalSubnet action=block dir=in enable=yes description="Block ping requests"
::netsh advfirewall firewall add rule name="(Y) All ICMP V4"                         protocol=icmpv4:any,any	remoteip=LocalSubnet action=block dir=in enable=yes description="Block ping requests"
::netsh advfirewall firewall add rule name="(Y) Block Type 13 ICMP V4"               protocol=icmpv4:any,any	remoteip=LocalSubnet action=block dir=in enable=yes description="Block ping requests"
