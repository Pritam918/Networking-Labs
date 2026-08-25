## 06. DHCP Configuration

##  Project Overview

This lab demonstrates how to configure **Dynamic Host Configuration Protocol (DHCP)** on a Cisco Router using **Cisco Packet Tracer**.

The router is configured as a DHCP server for two VLANs. PCs in both VLAN 10 and VLAN 20 automatically receive their IP address, subnet mask, default gateway, and DNS server through DHCP.

##  Objectives

* Configure DHCP on a Cisco Router
* Create separate DHCP pools for VLAN 10 and VLAN 20
* Configure DHCP excluded addresses
* Assign network addresses to DHCP pools
* Configure default gateways
* Configure DNS server
* Verify automatic IP address assignment
* Test gateway connectivity
* Test communication between different VLANs

##  Network Configuration

| VLAN    | Network           | Default Gateway |
| ------- | ----------------- | --------------- |
| VLAN 10 | `192.168.10.0/24` | `192.168.10.1`  |
| VLAN 20 | `192.168.20.0/24` | `192.168.20.1`  |

### DHCP Configuration

**VLAN 10**

* Network: `192.168.10.0/24`
* Gateway: `192.168.10.1`
* DNS: `8.8.8.8`

**VLAN 20**

* Network: `192.168.20.0/24`
* Gateway: `192.168.20.1`
* DNS: `8.8.8.8`

##  DHCP Configuration Commands

### VLAN 10

```bash
ip dhcp excluded-address 192.168.10.1

ip dhcp pool VLAN10
 network 192.168.10.0 255.255.255.0
 default-router 192.168.10.1
 dns-server 8.8.8.8
```

### VLAN 20

```bash
ip dhcp excluded-address 192.168.20.1

ip dhcp pool VLAN20
 network 192.168.20.0 255.255.255.0
 default-router 192.168.20.1
 dns-server 8.8.8.8
```

##  Verification & Testing

### VLAN 10 DHCP Test

VLAN 10 PC automatically received:

```text
IP Address      : 192.168.10.2
Subnet Mask     : 255.255.255.0
Default Gateway : 192.168.10.1
```

### VLAN 20 DHCP Test

VLAN 20 PC automatically received:

```text
IP Address      : 192.168.20.2
Subnet Mask     : 255.255.255.0
Default Gateway : 192.168.20.1
```

### Gateway Connectivity Test

VLAN 10 PC:

```bash
ping 192.168.10.1
```

Result: **Successful**

VLAN 20 PC:

```bash
ping 192.168.20.1
```

Result: **Successful**

### Inter-VLAN Connectivity Test

From VLAN 10 PC:

```bash
ping 192.168.20.2
```

Result: **Successful**

This confirms that devices in different VLANs can communicate through the router.

##  Screenshots

The following screenshots are included as evidence:

1. Full Network Topology
2. Router DHCP Configuration
3. VLAN 10 DHCP IP Assignment
4. VLAN 10 Gateway Ping
5. VLAN 20 DHCP IP Assignment
6. VLAN 20 Gateway Ping
7. Inter-VLAN Ping Test

##  Tools Used

* Cisco Packet Tracer
* Cisco Router
* Cisco Switch
* PCs
* DHCP
* VLAN
* Inter-VLAN Routing

##  Result

The DHCP configuration was successfully completed.

Both VLAN 10 and VLAN 20 PCs automatically received valid IP addresses from the Cisco Router. Gateway connectivity and inter-VLAN communication were also successfully verified.

##  Skills Practiced

* DHCP Server Configuration
* DHCP Pool Creation
* IP Address Management
* VLAN Networking
* Inter-VLAN Routing
* Network Troubleshooting
* Connectivity Testing
* Cisco IOS CLI

##  Author
Pritam Barua
