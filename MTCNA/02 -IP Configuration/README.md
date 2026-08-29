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


## Author
Pritam Barua
