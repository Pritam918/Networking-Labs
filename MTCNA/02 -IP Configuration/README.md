# 02. IP Address Configuration

## Description
This lab covers the assignment of static IP addresses to network interfaces on a MikroTik RouterOS device. Establishing static IPs on the WAN interface ensures proper routing to the ISP/Gateway, while the LAN interface configuration sets up the local default gateway for network clients.

## Objectives
- Configure static IP address on the WAN interface (`ether1`).
- Assign gateway IP address to the LAN interface (`ether2`).
- Verify IP bindings and interface communication status.

## Network Topology & IP Plan
| Interface | Role | IP Address / Subnet | Description |
|-----------|------|--------------------|-------------|
| `ether1`  | WAN  | `192.168.0.200/24` | Connected to Main Gateway / ISP |
| `ether2`  | LAN  | `10.10.10.1/24`    | Local Gateway for Office/Home Network |

---

## Commands Executed

```routeros
# 1. Assign Static IP to WAN Interface
/ip address add address=192.168.0.200/24 interface=ether1 comment="WAN-Interface"

# 2. Assign Gateway IP to LAN Interface
/ip address add address=10.10.10.1/24 interface=ether2 comment="LAN-Gateway"

[admin@MTCNA-R1] > /ip address print
Flags: X - disabled, I - invalid, D - dynamic 
 #   ADDRESS            NETWORK         INTERFACE
 0   192.168.0.200/24   192.168.0.0     ether1   
 1   10.10.10.1/24      10.10.10.0      ether2

##Author
Pritam Barua
