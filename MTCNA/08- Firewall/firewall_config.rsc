# 2026-09-09 13:32:43 by RouterOS 7.24.1
# system id = dVNnhqhvDDO
#
/ip firewall filter
add action=drop chain=input comment="Block ICMP Ping  Traffic" protocol=icmp
