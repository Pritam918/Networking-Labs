## 5. Inter-VLAN Routing

##  Project Overview

This project demonstrates **Inter-VLAN Routing using Router-on-a-Stick** in Cisco Packet Tracer.

The network consists of two switches, one router, and four PCs. VLANs are configured to separate the network into different broadcast domains, while the router provides communication between the VLANs.

##  Network Topology

* **Router:** Cisco 1941 (R1)
* **Switches:** Cisco 2960-24TT (SW1, SW2)
* **End Devices:** 4 PCs
* **SW1 ↔ SW2:** Trunk connection
* **SW1 ↔ R1:** Trunk connection
* **Routing Method:** Router-on-a-Stick

##  VLAN Configuration

| VLAN    | Network         | Default Gateway |
| ------- | --------------- | --------------- |
| VLAN 10 | 192.168.10.0/24 | 192.168.10.1    |
| VLAN 20 | 192.168.20.0/24 | 192.168.20.1    |

##  IP Addressing

| Device | IP Address    | VLAN    |
| ------ | ------------- | ------- |
| PC01   | 192.168.10.10 | VLAN 10 |
| PC02   | 192.168.20.10 | VLAN 20 |
| PC03   | 192.168.10.11 | VLAN 10 |
| PC04   | 192.168.20.11 | VLAN 20 |

##  Router Configuration

Router interface:

```text
GigabitEthernet0/0
```

VLAN 10 sub-interface:

```text
interface GigabitEthernet0/0.10
encapsulation dot1Q 10
ip address 192.168.10.1 255.255.255.0
```

VLAN 20 sub-interface:

```text
interface GigabitEthernet0/0.20
encapsulation dot1Q 20
ip address 192.168.20.1 255.255.255.0
```

##  Trunk Configuration

SW1 uses trunk ports to carry multiple VLANs.

The connection between **SW1 and SW2** is configured as a trunk.

The connection between **SW1 Fa0/24 and R1 GigabitEthernet0/0** is also configured as a trunk.

Example:

```text
interface FastEthernet0/24
switchport mode trunk
```

##  Verification & Testing

The Router sub-interfaces were verified using:

```text
show ip interface brief
```

The result confirmed:

```text
GigabitEthernet0/0.10    192.168.10.1    up    up
GigabitEthernet0/0.20    192.168.20.1    up    up
```

### Ping Test

Inter-VLAN communication was tested from PC01:

```text
ping 192.168.20.10
```

The ping was successful, confirming that **VLAN 10 and VLAN 20 can communicate through the router**.

##  Project Evidence

* `topology.png` — Network topology
* `ping-test.png` — Successful Inter-VLAN ping
* `router-config.png` — Router configuration/output
* `Inter-VLAN-Routing.pkt` — Cisco Packet Tracer project file

##  Learning Outcomes

Through this project, I practiced:

* VLAN configuration
* Access port configuration
* Switch trunking
* Router-on-a-Stick
* 802.1Q VLAN encapsulation
* Inter-VLAN routing
* IP addressing
* Default gateway configuration
* Network connectivity testing
* Cisco IOS CLI commands

##  Tools Used

* Cisco Packet Tracer
* Cisco IOS CLI
* Cisco 2960 Switch
* Cisco 1941 Router

##  Project Status

**Completed — Inter-VLAN Routing successfully configured and tested.**

## Author
Pritam Barua
