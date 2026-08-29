# 2026-08-29 12:55:27 by RouterOS 7.24.1
# system id = dVNnhqhvDDO
#
/ip address
add address=192.168.0.200/24 comment="WAN IP" interface=ether1 network=\
    192.168.0.0
add address=10.10.10.1/24 comment="LAN  IP" interface=ether2 network=\
    10.10.10.0
