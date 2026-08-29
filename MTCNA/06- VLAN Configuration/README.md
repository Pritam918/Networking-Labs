# 06. VLAN (Virtual Local Area Network) Configuration

##  Description
This lab covers the configuration of Virtual LANs (VLANs) on MikroTik RouterOS using the WinBox GUI. Creating VLAN sub-interfaces on a parent interface (`ether2`) allows logical network segmentation, separating traffic between different departments (Sales and HR) for enhanced security and efficiency.

---

##  Objectives
- Configure VLAN sub-interfaces with assigned VLAN IDs on parent interface `ether2`.
- Assign dedicated IP subnets to each VLAN interface.
- Isolate broadcast domains logically over a single physical link.
- Verify VLAN interface status and IP address bindings in WinBox GUI.

---

##  Network Configuration Details
| VLAN Name | VLAN ID | Subnet / Gateway | Parent Interface | Department |
|-----------|---------|------------------|------------------|------------|
| `VLAN10_Sales` | `10` | `10.10.10.1/24` | `ether2` | Sales Department |
| `VLAN20_HR` | `20` | `10.10.20.1/24` | `ether2` | HR Department |

---

## 🖱 WinBox GUI Configuration Steps

### Step 1: Create VLAN Interfaces
1. Navigate to **Interfaces** ➔ **VLAN** tab from the WinBox left menu.
2. Click the **`+` (Add)** button to create Sales VLAN:
   - **Name:** `VLAN10_Sales`
   - **VLAN ID:** `10`
   - **Interface:** Select `ether2`
   - Click **Apply**, then **OK**.
3. Click the **`+` (Add)** button to create HR VLAN:
   - **Name:** `VLAN20_HR`
   - **VLAN ID:** `20`
   - **Interface:** Select `ether2`
   - Click **Apply**, then **OK**.

### Step 2: Assign IP Addresses to VLAN Interfaces
1. Navigate to **IP** ➔ **Addresses**.
2. Click the **`+` (Add)** button for Sales Subnet:
   - **Address:** `10.10.10.1/24`
   - **Interface:** Select `VLAN10_Sales`
   - Click **Apply**, then **OK**.
3. Click the **`+` (Add)** button for HR Subnet:
   - **Address:** `10.10.20.1/24`
   - **Interface:** Select `VLAN20_HR`
   - Click **Apply**, then **OK**.


##  Included Artifacts
- `VLAN-config.rsc`: Exported RouterOS configuration script for Lab 06 settings.
  
## Author
Pritam Barua
