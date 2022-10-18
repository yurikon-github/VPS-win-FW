netsh advfirewall set currentprofile logging filename %systemroot%\system32\LogFiles\Firewall\pfirewall.log
netsh advfirewall set currentprofile logging maxfilesize 4096
::netsh advfirewall set currentprofile logging droppedconnections disable
netsh advfirewall set currentprofile logging droppedconnections enable
::netsh advfirewall set currentprofile logging allowedconnections enable