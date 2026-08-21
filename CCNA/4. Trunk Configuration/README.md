# 4. Trunk Configuration

##  Overview

This lab demonstrates the configuration of a **Trunk Link** between two Cisco switches using Cisco Packet Tracer.

A trunk link allows multiple VLANs to travel between switches over a single physical connection using **IEEE 802.1Q VLAN tagging**.

---

##  Objectives

* Understand the difference between Access and Trunk ports
* Create VLANs on multiple switches
* Assign access ports to VLANs
* Configure a trunk link between two switches
* Verify trunk configuration
* Test communication between devices in the same VLAN across different switches

---

##  Network Topology

```text
        VLAN 10                         VLAN 10
          PC1                             PC3
           |                               |
         Fa0/1                           Fa0/1
           |                               |
          SW1 =========================== SW2
              Fa0/3       TRUNK       Fa0/3
           |
         Fa0/2
           |
          PC2
        VLAN 20                             PC4
                                          VLAN 20
```

###  Trunk Link

```text
SW1 Fa0/3  =================  Fa0/3 SW2
                  TRUNK
```

---

##  VLAN Configuration

| VLAN    | Name  | Purpose          |
| ------- | ----- | ---------------- |
| VLAN 10 | SALES | Sales Department |
| VLAN 20 | IT    | IT Department    |

---

##  Configuration

### Step 1 — Create VLANs

The following VLANs were created on both switches:

```bash
enable
configure terminal

vlan 10
name SALES
exit

vlan 20
name IT
exit
```

---

### Step 2 — Configure Access Ports

Ports connected to end devices were configured as access ports.

Example:

```bash
interface fa0/1
switchport mode access
switchport access vlan 10
exit
```

```bash
interface fa0/2
switchport mode access
switchport access vlan 20
exit
```

---

### Step 3 — Configure Trunk Port

The connection between the two switches uses **FastEthernet0/3**.

#### SW1

```bash
enable
configure terminal

interface fa0/3
switchport mode trunk
end
```

#### SW2

```bash
enable
configure terminal

interface fa0/3
switchport mode trunk
end
```

---

##  Verification

The trunk configuration was verified using:

```bash
show interfaces trunk
```

The output confirmed that **Fa0/3** was operating as a trunk port.

---

##  Connectivity Testing

### VLAN 10 Test

A ping was performed between the VLAN 10 devices connected to different switches.

```text
PC1 → PC3
```

The ping was successful, confirming that VLAN 10 traffic was successfully carried across the trunk link.

### VLAN 20 Test

A ping was also performed between the VLAN 20 devices connected to different switches.

```text
PC2 → PC4
```

The ping was successful.

### Different VLAN Test

Communication between VLAN 10 and VLAN 20 was not successful because **Inter-VLAN Routing has not yet been configured**.

---

##  Screenshots

### Trunk Verification

![Trunk Verification](trunk-verification.png)

### Ping Test

![Ping Test](ping-test.png)

---

##  Tools Used

* Cisco Packet Tracer
* Cisco Catalyst Switch
* Cisco IOS CLI

---

##  Skills Practiced

`Trunking` • `802.1Q` • `VLAN` • `Switching` • `Cisco IOS` • `Packet Tracer` • `Network Troubleshooting`

---

##  Key Learning

A trunk port allows traffic from multiple VLANs to pass between switches through a single physical link.

In this lab, **Fa0/3** was configured as the trunk port on both switches.

---

##  Project File

The complete Cisco Packet Tracer project is available in:

`Trunk-Configuration.pkt`

---

Author 
Pritam Barua
