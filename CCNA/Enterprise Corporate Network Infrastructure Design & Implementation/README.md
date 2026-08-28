## Enterprise Corporate Network Infrastructure Design & Implementation

## 📌 Project Overview

This project demonstrates the design and implementation of a small enterprise network using Cisco Packet Tracer.

The network was built step-by-step with:

- VLAN Segmentation
- Access Port Configuration
- Trunking
- Inter-VLAN Routing
- Centralized DHCP
- DHCP Relay
- DNS
- OSPF Dynamic Routing
- NAT/PAT
- Extended ACL
- Guest Network Isolation
- End-to-End Verification

The main objective of this project is to build a structured, scalable, and secure enterprise-style network.

---

# 🖥️ Network Topology

![Network Topology](Screenshots/01-Topology.png)

### Network Architecture

    R2 / ISP
       │
       R1
       │
    CORE-SW
       │
       ├── VLAN 10 → MANAGEMENT
       ├── VLAN 20 → HR
       ├── VLAN 30 → FINANCE
       ├── VLAN 40 → IT
       ├── VLAN 50 → SALES
       ├── VLAN 60 → GUEST 🔒
       │
       └── VLAN 70 → SERVER
                    ├── DHCP Server
                    └── DNS Server

---

# 📋 IP Addressing Plan

## VLAN Addressing

| VLAN | Department | Network | Default Gateway |
|------|------------|---------|-----------------|
| VLAN 10 | MANAGEMENT | `192.168.10.0/24` | `192.168.10.1` |
| VLAN 20 | HR | `192.168.20.0/24` | `192.168.20.1` |
| VLAN 30 | FINANCE | `192.168.30.0/24` | `192.168.30.1` |
| VLAN 40 | IT | `192.168.40.0/24` | `192.168.40.1` |
| VLAN 50 | SALES | `192.168.50.0/24` | `192.168.50.1` |
| VLAN 60 | GUEST | `192.168.60.0/24` | `192.168.60.1` |
| VLAN 70 | SERVER | `192.168.70.0/24` | `192.168.70.1` |

## Server Addressing

| Server | VLAN | IP Address | Gateway |
|--------|------|------------|---------|
| DHCP Server | VLAN 70 | `192.168.70.2` | `192.168.70.1` |
| DNS Server | VLAN 70 | `192.168.70.3` | `192.168.70.1` |

## Router Transit Network

| Connection | Device | Interface | IP Address |
|------------|--------|-----------|------------|
| CORE-SW ↔ R1 | CORE-SW | Gi0/1 | `10.0.0.6/30` |
| CORE-SW ↔ R1 | R1 | Gi0/1 | `10.0.0.5/30` |
| R1 ↔ R2 | R1 | Gi0/0 | `10.0.0.1/30` |
| R1 ↔ R2 | R2 | Gi0/0 | `10.0.0.2/30` |

---

# 1️⃣ VLAN Configuration

## Objective

VLANs were created to logically separate different departments and network services.

### VLAN Structure

    VLAN 10 → MANAGEMENT
    VLAN 20 → HR
    VLAN 30 → FINANCE
    VLAN 40 → IT
    VLAN 50 → SALES
    VLAN 60 → GUEST
    VLAN 70 → SERVER

VLAN segmentation provides:

- Better network organization
- Smaller broadcast domains
- Improved security
- Easier traffic management
- Department-level separation

### Verification

    show vlan brief

![VLAN Configuration](Screenshots/02-VLAN-Configuration.png)

---

# 2️⃣ Access Port Configuration

End devices were assigned to their respective VLANs using access ports.

Example configuration:

    interface fastEthernet 0/x
    switchport mode access
    switchport access vlan 10

The same configuration concept was applied to the other department VLANs.

### Purpose

Access ports ensure that end devices belong to the correct VLAN.

---

# 3️⃣ Trunk Configuration

Trunk links were configured to carry multiple VLANs across a single physical connection.

Example configuration:

    interface fastEthernet 0/x
    switchport mode trunk

### Verification

    show interfaces trunk

![Trunk Configuration](Screenshots/03-Trunk-Configuration.png)

### Purpose

Trunking allows multiple VLANs to travel between network devices through a single physical link.

---

# 4️⃣ Inter-VLAN Routing

The CORE-SW was configured as a Layer-3 switch to provide routing between VLANs.

First, IP routing was enabled:

    enable
    configure terminal
    ip routing

Then an SVI was configured for each VLAN.

### VLAN 10

    interface vlan 10
    ip address 192.168.10.1 255.255.255.0
    no shutdown

### VLAN 20

    interface vlan 20
    ip address 192.168.20.1 255.255.255.0
    no shutdown

### VLAN 30

    interface vlan 30
    ip address 192.168.30.1 255.255.255.0
    no shutdown

### VLAN 40

    interface vlan 40
    ip address 192.168.40.1 255.255.255.0
    no shutdown

### VLAN 50

    interface vlan 50
    ip address 192.168.50.1 255.255.255.0
    no shutdown

### VLAN 60

    interface vlan 60
    ip address 192.168.60.1 255.255.255.0
    no shutdown

### VLAN 70

    interface vlan 70
    ip address 192.168.70.1 255.255.255.0
    no shutdown

### Result

The CORE-SW acts as the default gateway for all VLANs.

    VLAN 10 PC
        ↓
    192.168.10.1
        ↓
    CORE-SW
        ↓
    Other VLANs

### Verification

    show ip interface brief

![Inter-VLAN Routing](Screenshots/04-Inter-VLAN-Routing.png)

---

# 5️⃣ Server VLAN

A dedicated Server VLAN was created:

    VLAN 70
    Network: 192.168.70.0/24
    Gateway: 192.168.70.1

Two servers were placed inside VLAN 70.

### DHCP Server

    IP Address:      192.168.70.2
    Subnet Mask:     255.255.255.0
    Default Gateway: 192.168.70.1

### DNS Server

    IP Address:      192.168.70.3
    Subnet Mask:     255.255.255.0
    Default Gateway: 192.168.70.1

The server ports were configured as access ports in VLAN 70.

---

# 6️⃣ DHCP Configuration

## Objective

The DHCP server provides automatic IP addressing to clients in different VLANs.

The DHCP Server is located in:

    VLAN 70
    IP Address: 192.168.70.2

## DHCP Pools

Six DHCP pools were created:

| Pool | Network | Gateway | Start IP |
|------|---------|---------|----------|
| MANAGEMENT | `192.168.10.0/24` | `192.168.10.1` | `192.168.10.10` |
| HR | `192.168.20.0/24` | `192.168.20.1` | `192.168.20.10` |
| FINANCE | `192.168.30.0/24` | `192.168.30.1` | `192.168.30.10` |
| IT | `192.168.40.0/24` | `192.168.40.1` | `192.168.40.10` |
| SALES | `192.168.50.0/24` | `192.168.50.1` | `192.168.50.10` |
| GUEST | `192.168.60.0/24` | `192.168.60.1` | `192.168.60.10` |

All DHCP pools use:

    Subnet Mask: 255.255.255.0
    DNS Server: 192.168.70.3

![DHCP Server Configuration](Screenshots/05-DHCP-Server.png)

---

## DHCP Relay

Since the DHCP server is located in VLAN 70 while clients are located in different VLANs, DHCP relay was configured on the CORE-SW.

Example:

    interface vlan 10
    ip helper-address 192.168.70.2

The same configuration was applied to:

    VLAN 10
    VLAN 20
    VLAN 30
    VLAN 40
    VLAN 50
    VLAN 60

VLAN 70 does not require DHCP relay because the DHCP Server is directly connected to the same VLAN.

---

## DHCP Verification

Clients successfully received IP addresses from their corresponding DHCP pools.

Example:

    IP Address:      192.168.10.x
    Subnet Mask:     255.255.255.0
    Default Gateway: 192.168.10.1
    DNS Server:      192.168.70.3

![DHCP Client Test](Screenshots/06-DHCP-Client-Test.png)

---

# 7️⃣ OSPF Dynamic Routing

## Objective

OSPF was configured to provide dynamic routing between:

    CORE-SW
       ↕
      R1
       ↕
    R2 / ISP

OSPF uses Area 0 in this project.

## OSPF Router IDs

| Device | Router ID |
|--------|-----------|
| CORE-SW | `3.3.3.3` |
| R1 | `1.1.1.1` |
| R2 | `2.2.2.2` |

---

## R1 OSPF

    router ospf 1
    router-id 1.1.1.1
    network 10.0.0.0 0.0.0.3 area 0
    network 10.0.0.4 0.0.0.3 area 0

---

## R2 OSPF

    router ospf 1
    router-id 2.2.2.2
    network 10.0.0.0 0.0.0.3 area 0

---

## CORE-SW OSPF

    router ospf 1
    router-id 3.3.3.3

    network 10.0.0.4 0.0.0.3 area 0

    network 192.168.10.0 0.0.0.255 area 0
    network 192.168.20.0 0.0.0.255 area 0
    network 192.168.30.0 0.0.0.255 area 0
    network 192.168.40.0 0.0.0.255 area 0
    network 192.168.50.0 0.0.0.255 area 0
    network 192.168.60.0 0.0.0.255 area 0
    network 192.168.70.0 0.0.0.255 area 0

### Verification

    show ip ospf neighbor

OSPF neighbors successfully reached the FULL state.

![OSPF Configuration](Screenshots/07-OSPF-Configuration.png)

![OSPF Neighbor](Screenshots/08-OSPF-Neighbor.png)

---

# 8️⃣ NAT / PAT Configuration

## Objective

NAT/PAT allows multiple internal private IP addresses to access external networks using the R1 outside interface.

## NAT Inside Interface

    interface gigabitEthernet 0/1
    ip nat inside

## NAT Outside Interface

    interface gigabitEthernet 0/0
    ip nat outside

## NAT ACL

    access-list 1 permit 192.168.0.0 0.0.255.255

## PAT Configuration

    ip nat inside source list 1 interface gigabitEthernet 0/0 overload

The `overload` keyword enables PAT, allowing multiple internal hosts to share one outside IP address.

## Default Route

R1 forwards unknown traffic toward the ISP router:

    ip route 0.0.0.0 0.0.0.0 10.0.0.2

![NAT/PAT Configuration](Screenshots/09-NAT-PAT-Configuration.png)

---

## NAT Verification

    show ip nat translations

The NAT translation table was successfully populated after internal clients generated outside traffic.

![NAT Translation](Screenshots/10-NAT-Translation.png)

---

# 9️⃣ ACL — Guest Network Isolation

## Objective

The Guest VLAN was isolated from internal enterprise networks.

Guest Network:

    VLAN: 60
    Network: 192.168.60.0/24
    Gateway: 192.168.60.1

## Security Policy

    Guest → MANAGEMENT   ❌
    Guest → HR           ❌
    Guest → FINANCE      ❌
    Guest → IT           ❌
    Guest → SALES        ❌
    Guest → SERVER       ❌

    Guest → Outside      ✅

This provides Guest Network Isolation.

---

## Extended ACL

    ip access-list extended GUEST-ISOLATION

    deny ip 192.168.60.0 0.0.0.255 192.168.10.0 0.0.0.255
    deny ip 192.168.60.0 0.0.0.255 192.168.20.0 0.0.0.255
    deny ip 192.168.60.0 0.0.0.255 192.168.30.0 0.0.0.255
    deny ip 192.168.60.0 0.0.0.255 192.168.40.0 0.0.0.255
    deny ip 192.168.60.0 0.0.0.255 192.168.50.0 0.0.0.255
    deny ip 192.168.60.0 0.0.0.255 192.168.70.0 0.0.0.255

    permit ip 192.168.60.0 0.0.0.255 any

The ACL was applied inbound on VLAN 60:

    interface vlan 60
    ip access-group GUEST-ISOLATION in

### Verification

    show access-lists GUEST-ISOLATION

![Guest ACL Configuration](Screenshots/11-ACL-Guest-Isolation.png)

---

## ACL Testing

A Guest PC was tested against protected internal networks.

Example:

    Guest PC
       ↓
    ping 192.168.10.10
       ↓
    Request Timed Out ❌

This confirms that the ACL successfully blocks Guest access to protected internal networks.

![ACL Test](Screenshots/12-ACL-Test.png)

---

# 🔟 DNS Configuration

## Objective

The DNS server provides hostname-to-IP address resolution for internal services.

DNS Server:

    IP Address:      192.168.70.3
    Subnet Mask:     255.255.255.0
    Default Gateway: 192.168.70.1

DNS Service was enabled.

## DNS Record

The following A record was created:

    Name:     pbtech.local
    Type:     A Record
    Address:  192.168.70.3

Therefore:

    pbtech.local
          ↓
    192.168.70.3

![DNS Configuration](Screenshots/13-DNS-Configuration.png)

---

## DHCP + DNS Integration

The DHCP pools were configured to provide:

    DNS Server: 192.168.70.3

Therefore, clients automatically receive the DNS server address through DHCP.

---

## DNS Verification

From a client:

    ping pbtech.local

The hostname successfully resolved to:

    192.168.70.3

This confirms that DNS resolution is working correctly.

![DNS Test](Screenshots/14-DNS-Test.png)

---

# 1️⃣1️⃣ Final Verification

After completing all configurations, the network was tested end-to-end.

## CORE-SW

    show vlan brief
    show ip interface brief
    show ip route
    show ip ospf neighbor
    show access-lists

## R1

    show ip interface brief
    show ip route
    show ip ospf neighbor
    show ip nat translations
    show ip nat statistics

## R2

    show ip interface brief
    show ip route

![Final Verification](Screenshots/15-Final-Verification.png)

---

# 🧪 End-to-End Testing

## DHCP Test

Clients successfully received IP addresses according to their VLAN.

    VLAN 10 → 192.168.10.x
    VLAN 20 → 192.168.20.x
    VLAN 30 → 192.168.30.x
    VLAN 40 → 192.168.40.x
    VLAN 50 → 192.168.50.x
    VLAN 60 → 192.168.60.x

## Inter-VLAN Routing Test

Communication between VLANs was successfully tested through the CORE-SW.

Example:

    ping 192.168.20.10
    ping 192.168.30.10

## OSPF Test

OSPF neighbors successfully established adjacency and reached the FULL state.

    show ip ospf neighbor

## NAT/PAT Test

NAT translations were successfully generated.

    show ip nat translations

## ACL Test

Guest clients were prevented from accessing protected internal networks.

## DNS Test

    ping pbtech.local

Successfully resolved:

    pbtech.local → 192.168.70.3

---

# 🔐 Security Design

The network uses VLAN segmentation and ACL-based isolation to improve security.

The Guest VLAN is isolated from internal department and server networks.

    CORE-SW
       │
       ├── Internal VLANs
       │
       ├── Server VLAN
       │
       └── Guest VLAN
              │
             🔒
             ACL
              │
       Controlled Access

This prevents Guest users from directly accessing internal enterprise resources.

---

# 📊 Final Network Features

| Feature | Status |
|---------|--------|
| VLAN Segmentation | ✅ |
| Access Port Configuration | ✅ |
| Trunking | ✅ |
| Layer-3 Switching | ✅ |
| Inter-VLAN Routing | ✅ |
| DHCP Server | ✅ |
| DHCP Relay | ✅ |
| Dedicated Server VLAN | ✅ |
| DNS Server | ✅ |
| OSPF Dynamic Routing | ✅ |
| NAT | ✅ |
| PAT / NAT Overload | ✅ |
| Default Routing | ✅ |
| Guest Network Isolation | ✅ |
| Extended ACL | ✅ |
| End-to-End Verification | ✅ |

---

# 📁 Project Structure

    Enterprise Corporate Network Infrastructure Design & Implementation/
    │
    ├── PB Technologies Ltd..pkt
    ├── README.md
    │
    └── Screenshots/
        │
        ├── 01-Topology.png
        ├── 02-VLAN-Configuration.png
        ├── 03-Trunk-Configuration.png
        ├── 04-Inter-VLAN-Routing.png
        ├── 05-DHCP-Server.png
        ├── 06-DHCP-Client-Test.png
        ├── 07-OSPF-Configuration.png
        ├── 08-OSPF-Neighbor.png
        ├── 09-NAT-PAT-Configuration.png
        ├── 10-NAT-Translation.png
        ├── 11-ACL-Guest-Isolation.png
        ├── 12-ACL-Test.png
        ├── 13-DNS-Configuration.png
        ├── 14-DNS-Test.png
        └── 15-Final-Verification.png

---

# 📸 Screenshot Documentation

| No. | Screenshot | Purpose |
|-----|------------|---------|
| 01 | `01-Topology.png` | Complete network topology |
| 02 | `02-VLAN-Configuration.png` | VLAN creation and verification |
| 03 | `03-Trunk-Configuration.png` | Trunk configuration |
| 04 | `04-Inter-VLAN-Routing.png` | SVI and Layer-3 routing |
| 05 | `05-DHCP-Server.png` | DHCP pool configuration |
| 06 | `06-DHCP-Client-Test.png` | DHCP client verification |
| 07 | `07-OSPF-Configuration.png` | OSPF configuration |
| 08 | `08-OSPF-Neighbor.png` | OSPF adjacency verification |
| 09 | `09-NAT-PAT-Configuration.png` | NAT/PAT configuration |
| 10 | `10-NAT-Translation.png` | NAT translation verification |
| 11 | `11-ACL-Guest-Isolation.png` | Guest isolation ACL |
| 12 | `12-ACL-Test.png` | ACL blocking verification |
| 13 | `13-DNS-Configuration.png` | DNS record configuration |
| 14 | `14-DNS-Test.png` | DNS resolution verification |
| 15 | `15-Final-Verification.png` | Final network verification |

---

# 🛠️ Tools Used

- Cisco Packet Tracer
- Cisco IOS CLI
- VLAN
- Inter-VLAN Routing
- DHCP
- DHCP Relay
- DNS
- OSPF
- NAT/PAT
- Extended ACL

---

# 🎯 Conclusion

This project demonstrates the implementation of a complete enterprise-style network using Cisco Packet Tracer.

The network was progressively developed from basic VLAN segmentation to routing, network services, NAT, and security.

### Final Architecture

    VLAN
     ↓
    Trunk
     ↓
    Inter-VLAN Routing
     ↓
    DHCP
     ↓
    DNS
     ↓
    OSPF
     ↓
    NAT/PAT
     ↓
    ACL Security
     ↓
    Final Verification

The final network provides:

- Structured VLAN segmentation
- Dynamic IP addressing
- Internal DNS resolution
- Dynamic routing with OSPF
- Internet connectivity through NAT/PAT
- Guest network isolation
- End-to-end connectivity and verification

---

# 📌 Project Status

**Completed ✅**

The network has been configured, tested, and verified successfully.

## Designed and Implemented by
Pritam Barua 
Bsc in Computer Science and Engineering
Email: je.pritam429@gmail.com
