# 03- VLAN Configuration

## Objective

Configure VLANs on a Cisco 2960 switch and assign switch ports to different VLANs using Cisco Packet Tracer.

## Topology

- 1 Cisco 2960 Switch
- 2 PCs
- PC1 connected to Fa0/1
- PC2 connected to Fa0/2

## IP Addressing

| Device | IP Address | Subnet Mask | VLAN |
|---|---|---|---|
| PC1 | 192.168.10.10 | 255.255.255.0 | VLAN 10 |
| PC2 | 192.168.20.10 | 255.255.255.0 | VLAN 20 |

## VLAN Configuration

### VLAN 10 - SALES

vlan 10
name SALES

### VLAN 20 - IT

vlan 20
name IT

## Port Configuration

### PC1 - Fa0/1

interface fastethernet 0/1
switchport mode access
switchport access vlan 10

### PC2 - Fa0/2

interface fastethernet 0/2
switchport mode access
switchport access vlan 20

## Verification

The VLAN configuration was verified using:

show vlan brief

Expected result:

VLAN 10 → SALES → Fa0/1
VLAN 20 → IT → Fa0/2

## Ping Test

PC1 and PC2 were placed in different VLANs.

PC1:

192.168.10.10

PC2:

192.168.20.10

Ping test from PC1 to PC2:

ping 192.168.20.10

Result:

Request timed out

This result is expected because VLAN 10 and VLAN 20 are separate Layer 2 networks and no Layer 3 routing was configured.

## Skills Practiced

- VLAN creation
- VLAN naming
- Access port configuration
- Switchport VLAN assignment
- VLAN verification
- Network segmentation
- Ping testing
- Cisco IOS CLI

## Tool

Cisco Packet Tracer

## Author

Pritam Barua
