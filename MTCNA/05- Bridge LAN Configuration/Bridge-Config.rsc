# 2026-08-29 21:03:59 by RouterOS 7.24.1
# system id = dVNnhqhvDDO
#
/interface bridge
add name=Bridge-LAN
/interface bridge port
add bridge=Bridge-LAN interface=ether2
add bridge=Bridge-LAN interface=ether3
