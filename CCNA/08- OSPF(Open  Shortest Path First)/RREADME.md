## 08. OSPF — Open Shortest Path First

## Objective

Configure OSPF dynamic routing between two Cisco routers and verify connectivity between two different LAN networks.

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

## OSPF Configuration

### R1

```text
enable
configure terminal
router ospf 1
router-id 1.1.1.1
network 192.168.1.0 0.0.0.255 area 0
network 10.0.0.0 0.0.0.3 area 0
end
```

### R2

```text
enable
configure terminal
router ospf 1
router-id 2.2.2.2
network 192.168.2.0 0.0.0.255 area 0
network 10.0.0.0 0.0.0.3 area 0
end
```

## OSPF Verification

### OSPF Neighbor

Command used:

```text
show ip ospf neighbor
```

R1 and R2 successfully established an OSPF neighbor relationship with **FULL** state.

### Routing Table

Command used:

```text
show ip route
```

The remote LAN networks were learned through OSPF and appeared with the **O** routing code.

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

* `topology.png` — Network topology
* `R1-OSPF-neighbor.png` — R1 OSPF neighbor verification
* `R2-OSPF-neighbor.png` — R2 OSPF neighbor verification
* `R1-routing-table.png` — R1 routing table showing OSPF route
*  R2-routing-table.png` — R2 routing table showing OSPF route
* `PC1-to-PC2-ping.png` — PC1 to PC2 connectivity test
*  PC2-to-PC1-ping.png` — PC2 to PC1 connectivity test

## Key Concepts Learned

* OSPF dynamic routing
* OSPF Router ID
* OSPF Process ID
* OSPF Area 0
* OSPF network statements
* OSPF neighbor relationship
* OSPF routing table
* Dynamic route learning
* End-to-end connectivity verification

## Result

OSPF was successfully configured between R1 and R2. The routers established a **FULL OSPF neighbor relationship**, learned the remote LAN networks dynamically, and successfully provided end-to-end connectivity between PC1 and PC2.

---
##  Author
Pritam Barua

