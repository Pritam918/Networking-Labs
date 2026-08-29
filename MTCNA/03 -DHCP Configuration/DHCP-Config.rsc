# 2026-08-29 13:18:15 by RouterOS 7.24.1
# system id = dVNnhqhvDDO
#
/ip dhcp-server
add address-pool=dhcp_pool0 interface=ether2 lease-time=10h name=dhcp1
/ip dhcp-server network
add address=10.10.10.0/24 dns-server=8.8.8.8 gateway=10.10.10.1
