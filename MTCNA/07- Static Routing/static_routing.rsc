# 2026-09-09 12:45:34 by RouterOS 7.24.1
# system id = dVNnhqhvDDO
#
/ip route
add comment="Route to  Office Lan" disabled=no dst-address=192.168.20.0/24 \
    gateway=10.10.10.2 routing-table=main
