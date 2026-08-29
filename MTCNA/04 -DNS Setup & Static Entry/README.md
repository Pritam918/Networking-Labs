# 04. DNS Server & Static DNS Configuration

##  Description
This lab covers the configuration of MikroTik RouterOS as a DNS Resolver/Relay for local network clients using the WinBox GUI. It enables DNS caching to speed up domain resolution and configures a local static DNS entry for internal services without needing an external DNS server.

---

##  Objectives
- Enable DNS caching and allow remote DNS requests from LAN clients.
- Configure public upstream DNS servers (`8.8.8.8` and `1.1.1.1`).
- Add a local static DNS entry mapping `mycompany.local` to the LAN Gateway IP.
- Verify DNS resolution settings via WinBox GUI.

---

##  Network Configuration Details
| Setting Parameter | Configured Value | Description |
|------------------|------------------|-------------|
| **Primary DNS** | `8.8.8.8` | Google Primary Public DNS |
| **Secondary DNS** | `1.1.1.1` | Cloudflare Secondary Public DNS |
| **Allow Remote Requests** | `Enabled (Checked)` | Permits LAN clients to use Router as DNS |
| **Static Domain Name** | `mycompany.local` | Custom internal domain |
| **Static Mapped IP** | `10.10.10.1` | Router LAN Interface IP |

---

##  WinBox GUI Configuration Steps

### Step 1: DNS Server Setup
1. Navigate to **IP** ➔ **DNS** from the WinBox left menu.
2. In the **Servers** box, enter `8.8.8.8`.
3. Click the down arrow (▼) and enter `1.1.1.1`.
4. Check the box for **Allow Remote Requests**.
5. Click **Apply**, then **OK**.

### Step 2: Adding a Static DNS Entry
1. Navigate to **IP** ➔ **DNS** and click on the **Static** button on the right side.
2. Click the **`+` (Add)** button.
3. **Name:** `mycompany.local`
4. **Address:** `10.10.10.1`
5. Click **Apply**, then **OK**.

---

##  Included Artifacts
- `DNS-config.rsc`: Exported RouterOS configuration script for Lab 04 settings.

## Author
Pritam Barua
