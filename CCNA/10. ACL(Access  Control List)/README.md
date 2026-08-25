# 10. ACL — Access Control List

## Objective

Configure and verify Standard ACL and Extended ACL on Cisco routers using Cisco Packet Tracer.

This lab demonstrates how ACLs are used to control network traffic by permitting or denying specific source IP addresses, destination addresses, protocols, and ports.

---

## Topology

```text
PC1 ─┐
PC2 ─┼── SW1 ── R1 ───── R2 ───── Server
PC3 ─┘
```

---

## IP Addressing

| Device | Interface | IP Address    | Subnet Mask     | Default Gateway |
| ------ | --------- | ------------- | --------------- | --------------- |
| PC1    | Fa0       | 192.168.10.10 | 255.255.255.0   | 192.168.10.1    |
| PC2    | Fa0       | 192.168.10.20 | 255.255.255.0   | 192.168.10.1    |
| PC3    | Fa0       | 192.168.10.30 | 255.255.255.0   | 192.168.10.1    |
| R1     | G0/0      | 192.168.10.1  | 255.255.255.0   | —               |
| R1     | G0/1      | 10.0.0.1      | 255.255.255.252 | —               |
| R2     | G0/0      | 10.0.0.2      | 255.255.255.252 | —               |
| R2     | G0/1      | 192.168.20.1  | 255.255.255.0   | —               |
| Server | Fa0       | 192.168.20.10 | 255.255.255.0   | 192.168.20.1    |

---

# Part 1 — Standard ACL

## Objective

Block PC1 from accessing the Server while allowing PC2 and PC3.

## Configuration

```cisco
access-list 10 deny host 192.168.10.10
access-list 10 permit any

interface gigabitEthernet 0/1
ip access-group 10 out
```

## Verification

```cisco
show access-lists
```

## Result

```text
PC1 → Server     Blocked
PC2 → Server     Allowed
PC3 → Server     Allowed
```

---


# Part 2 — Extended ACL

## Objective

Block only HTTP traffic (TCP port 80) from PC1 to the Server while allowing other traffic.

## Configuration

```cisco
access-list 100 deny tcp host 192.168.10.10 host 192.168.20.10 eq 80
access-list 100 permit ip any any

interface gigabitEthernet 0/1
ip access-group 100 out
```

> Note: Cisco Packet Tracer may display TCP port 80 as `www`.

## Verification

```cisco
show access-lists
```

## Result

```text
PC1 → Server HTTP     Blocked
PC1 → Server Ping     Allowed
Other IP Traffic      Allowed
```

---


# Verification Commands

## Display ACLs

```cisco
show access-lists
```

## Display Interface Status

```cisco
show ip interface brief
```

## Display Running Configuration

```cisco
show running-config
```

---

# Connectivity Testing

## PC1 → Server

```text
ping 192.168.20.10
```

Ping remained successful after applying the Extended ACL because ICMP traffic was not blocked.

---

## PC1 → Server HTTP

```text
http://192.168.20.10
```

HTTP traffic was blocked by the Extended ACL.

---

# Standard ACL vs Extended ACL

| Feature        | Standard ACL        | Extended ACL       |
| -------------- | ------------------- | ------------------ |
| Source IP      | ✅                   | ✅                  |
| Destination IP | ❌                   | ✅                  |
| Protocol       | ❌                   | ✅                  |
| Port Number    | ❌                   | ✅                  |
| Example        | Block a specific PC | Block HTTP traffic |

---

# Screenshots

* `Topology.png` — Network topology
* `Extended ACL.png` — Extended ACL
* `Extended Access-list.png` — Extended Access-list verification
* `Extended- PC1 HTTP Blocked.png` — PC1 HTTP blocked
* `Extended-- PC1 Ping allowed.png` — PC1 ping allowed
* `Standard ACL.png` — Standard ACL
* `Standard- PC1 to Server ping.png` — PC1 to Server ping
* `Standard-PC2 to server ping.png` — PC2 to Server ping

---

# Packet Tracer File

* `Standard ACL.pkt` — Cisco Packet Tracer project file
* `Extended ACL.pkt` — Cisco Packet Tracer project file
---

# Key Concepts Learned

* Access Control List (ACL)
* Standard ACL
* Extended ACL
* Permit and Deny
* Source IP filtering
* Destination IP filtering
* Protocol filtering
* TCP port filtering
* HTTP port 80
* ACL interface direction
* ACL verification
* Network traffic filtering
* Cisco IOS ACL configuration

---

# Result

Standard and Extended ACLs were successfully configured and verified on Cisco routers.

The Standard ACL blocked PC1 based on its source IP address while allowing other PCs.

The Extended ACL blocked HTTP traffic from PC1 to the Server while allowing ICMP traffic such as ping.

---

## Author

**Pritam Barua**
