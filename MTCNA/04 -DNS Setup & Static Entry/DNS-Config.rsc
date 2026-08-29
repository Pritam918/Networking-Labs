# 2026-08-29 13:47:43 by RouterOS 7.24.1
# system id = dVNnhqhvDDO
#
/ip dns
set allow-remote-requests=yes servers=8.8.8.8,1.1.1.1
/ip dns static
add address=10.10.10.1 name=pbtech.local type=A
