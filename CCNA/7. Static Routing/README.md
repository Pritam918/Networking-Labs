# 7. Static Routing

## Objective

Configure static routing between two different LAN networks using two Cisco routers and verify end-to-end connectivity.

## Topology

```text
PC1 ── SW1 ── R1 ───── R2 ── SW2 ── PC2
```

## IP Addressing

| Device | Interface | IP Address   | Subnet Mask     |
| ------ | --------- | ------------ | --------------- |
| PC1    | Fa0       | 192.168.1.10 | 255.255.255.0   |
| R1     | G0/0      | 192.168.1.1  | 255.255.255.0   |
| R1     | G0/1      | 10.0.0.1     | 255.255.255.252 |
| R2     | G0/1      | 10.0.0.2     | 255.255.255.252 |
| R2     | G0/0      | 192.168.2.1  | 255.255.255.0   |
| PC2    | Fa0       | 192.168.2.10 | 255.255.255.0   |

## Static Route Configuration

### R1

```text
ip route 192.168.2.0 255.255.255.0 10.0.0.2
```

### R2

```text
ip route 192.168.1.0 255.255.255.0 10.0.0.1
```

## Verification

### R1 Routing Table

The routing table was checked using:

```text
show ip route
```

The static route to `192.168.2.0/24` was successfully displayed.

### R2 Routing Table

The routing table was checked using:

```text
show ip route
```

The static route to `192.168.1.0/24` was successfully displayed.

## Connectivity Testing

### PC1 → PC2

```text
ping 192.168.2.10
```

Ping was successful.

### PC2 → PC1

```text
ping 192.168.1.10
```

Ping was successful.

## Screenshots

1. `topology.png` — Network topology
2. `R1-routing-table.png` — R1 static route verification
3. `R2-routing-table.png` — R2 static route verification
4. `PC1-to-PC2-ping.png` — PC1 to PC2 connectivity test
5. `PC2-to-PC1-ping.png` — PC2 to PC1 connectivity test

## Result

Static routing was successfully configured between the two LAN networks, and end-to-end connectivity between PC1 and PC2 was verified successfully.

---

##  Author
Pritam Barua
