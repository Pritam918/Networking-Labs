# 2026-08-28 13:42:30 by RouterOS 7.24.1
# system id = dVNnhqhvDDO
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
/ip dhcp-client
add interface=ether1 name=client1
/ip service
set ftp disabled=yes
set telnet disabled=yes
set www disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=Asia/Dhaka
/system identity
set name=MTCNA-R1
/system ntp client
set enabled=yes
/system ntp client servers
add address=time.google.com
