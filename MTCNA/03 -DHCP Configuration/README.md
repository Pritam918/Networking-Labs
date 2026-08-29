# 03. DHCP Server Configuration

##  Description
This lab demonstrates how to configure a DHCP Server on a MikroTik RouterOS device using the WinBox GUI interface without using CLI commands. The DHCP Server automatically distributes dynamic IP addresses, Default Gateway, and DNS settings to local network clients on the `ether2` interface.

---

##  Objectives
- Configure an IP Pool for dynamic IP assignment.
- Set up the DHCP Server on the LAN interface (`ether2`) using the WinBox **DHCP Setup** wizard.
- Define Default Gateway and DNS parameters for local network clients.
- Verify DHCP Server and Network profiles in WinBox.

---

##  Network Configuration Details
| Parameter | Configured Value | Description |
|-----------|------------------|-------------|
| **DHCP Interface** | `ether2` | LAN Interface for local clients |
| **DHCP Address Space** | `10.10.10.0/24` | Local Subnet |
| **Gateway for DHCP** | `10.10.10.1` | Router LAN IP (Default Gateway) |
| **Addresses to Give Out** | `10.10.10.10 - 10.10.10.254` | Assigned Dynamic IP Range |
| **DNS Servers** | `8.8.8.8`, `1.1.1.1` | Public Primary & Secondary DNS |
| **Lease Time** | `10:00:00` | IP Lease Duration (10 Hours) |

---

##  WinBox GUI Configuration Steps

1. **Open DHCP Setup Wizard:**
   - Navigate to **IP** ➔ **DHCP Server** from the WinBox left menu.
   - Click on the **DHCP Setup** button at the top.

2. **Complete the Setup Wizard:**
   - **DHCP Server Interface:** Select `ether2` ➔ Click **Next**.
   - **DHCP Address Space:** Keep `10.10.10.0/24` ➔ Click **Next**.
   - **Gateway for DHCP Network:** Keep `10.10.10.1` ➔ Click **Next**.
   - **Addresses to Give Out:** Enter `10.10.10.10-10.10.10.254` ➔ Click **Next**.
   - **DNS Servers:** Enter `8.8.8.8, 1.1.1.1` ➔ Click **Next**.
   - **Lease Time:** Keep `10:00:00` ➔ Click **Next**.
   - Click **OK** on the completion dialog.

---

##  Included Artifacts
- `DHCP-Config.rsc`: Exported RouterOS configuration script for Lab 03.

## Author
Pritam Barua
