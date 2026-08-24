# 9. Static NAT — Network Address Translation

## Objective

Configure Static NAT on a Cisco router to translate an inside local private IP address into an inside global IP address and verify end-to-end connectivity.

## Topology

```text
PC0 ── SW0 ── R0 ───── R1 ───── Server0
             NAT
```

## IP Addressing

| Device  | Interface | IP Address   | Subnet Mask     |
| ------- | --------- | ------------ | --------------- |
| PC0     | Fa0       | 192.168.1.10 | 255.255.255.0   |
| R0      | G0/0      | 192.168.1.1  | 255.255.255.0   |
| R0      | G0/1      | 10.0.0.1     | 255.255.255.252 |
| R1      | G0/0      | 10.0.0.2     | 255.255.255.252 |
| R1      | G0/1      | 200.10.10.1  | 255.255.255.0   |
| Server0 | Fa0       | 200.10.10.10 | 255.255.255.0   |

### NAT Mapping

| Type          | IP Address   |
| ------------- | ------------ |
| Inside Local  | 192.168.1.10 |
| Inside Global | 200.10.10.20 |

```text
192.168.1.10  →  200.10.10.20
Inside Local     Inside Global
```

## NAT Configuration

### R0

```cisco
enable
configure terminal

interface gigabitEthernet0/0
 ip address 192.168.1.1 255.255.255.0
 ip nat inside
 no shutdown
exit

interface gigabitEthernet0/1
 ip address 10.0.0.1 255.255.255.252
 ip nat outside
 no shutdown
exit

ip nat inside source static 192.168.1.10 200.10.10.20

ip route 200.10.10.0 255.255.255.0 10.0.0.2

end
```

### R1

```cisco
enable
configure terminal

interface gigabitEthernet0/0
 ip address 10.0.0.2 255.255.255.252
 no shutdown
exit

interface gigabitEthernet0/1
 ip address 200.10.10.1 255.255.255.0
 no shutdown
exit

ip route 200.10.10.20 255.255.255.255 10.0.0.1

end
```

## Static NAT Mapping

The following static NAT mapping was configured on R0:

```cisco
ip nat inside source static 192.168.1.10 200.10.10.20
```

This creates a permanent one-to-one mapping:

```text
Inside Local:   192.168.1.10
Inside Global:  200.10.10.20
```

## NAT Verification

### NAT Translation Table

Command used:

```cisco
show ip nat translations
```

The NAT translation table should show the mapping between the inside local and inside global addresses.

```text
Inside Local       Inside Global
192.168.1.10       200.10.10.20
```

### NAT Statistics

Command used:

```cisco
show ip nat statistics
```

This command is used to verify NAT interfaces, translations, and NAT statistics.

## Routing Verification

### R0

Command used:

```cisco
show ip route
```

R0 should have a route to the Server network:

```text
200.10.10.0/24 via 10.0.0.2
```

### R1

Command used:

```cisco
show ip route
```

R1 should have a route to the NAT global address:

```text
200.10.10.20/32 via 10.0.0.1
```

## Connectivity Testing

### PC0 → R0

Command used:

```text
ping 192.168.1.1
```

Ping was successful.

### PC0 → R1

Command used:

```text
ping 10.0.0.2
```

Ping was successful.

### PC0 → Server0

Command used:

```text
ping 200.10.10.10
```

Ping was successful.

### R1 → NAT Global Address

Command used:

```text
ping 200.10.10.20
```

Ping was successful.

This verifies that traffic from the outside network can reach PC0 through the Static NAT mapping.

## NAT Packet Flow

### Inside → Outside

```text
PC0
192.168.1.10
     │
     │
     ▼
R0
192.168.1.1 / 10.0.0.1
     │
     │ NAT Translation
     ▼
200.10.10.20
     │
     ▼
R1
10.0.0.2
     │
     ▼
Server0
200.10.10.10
```

### Outside → Inside

```text
R1
     │
     │ Destination: 200.10.10.20
     ▼
R0
     │
     │ NAT Translation
     ▼
192.168.1.10
     │
     ▼
PC0
```

## Screenshots

### Topology


### Router0 Interface and Routing


### Static NAT Configuration


### NAT Translation


### NAT Connectivity


### PC0 to Server


### Server IP Configuration


## Key Concepts Learned

* Network Address Translation (NAT)
* Static NAT
* Inside Local address
* Inside Global address
* NAT Inside interface
* NAT Outside interface
* One-to-one IP address translation
* Static routing
* NAT translation table
* NAT verification
* Cisco IOS NAT configuration
* ICMP connectivity testing

## Result

Static NAT was successfully configured on R0. The inside local address `192.168.1.10` was statically translated to the inside global address `200.10.10.20`.

The NAT translation table successfully displayed the configured mapping, and connectivity was verified between the inside host, routers, and server network.

##  Author
Pritam Barua
