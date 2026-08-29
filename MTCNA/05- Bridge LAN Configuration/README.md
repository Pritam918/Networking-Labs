# 5. Bridge LAN Configuration

## Description
This lab demonstrates the configuration of a Bridge interface on MikroTik RouterOS using the WinBox GUI. Creating a bridge combines multiple physical interfaces (e.g., `ether2` and `ether3`) into a single logical Layer 2 broadcast domain, allowing connected devices to act as if they are connected to a physical Ethernet switch.

---

## Objectives
- Create a new logical Bridge interface named `bridge-lan`.
- Add physical LAN interfaces (`ether2` and `ether3`) as member ports to the bridge.
- Unify multiple physical interfaces under a single local network segment.
- Verify active bridge ports and configuration status in WinBox GUI.

---

## Network Configuration Details
| Parameter | Configured Value | Description |
|-----------|------------------|-------------|
| **Bridge Name** | `bridge-lan` | Master logical bridge interface |
| **Member Port 1** | `ether2` | Physical LAN Port 1 assigned to Bridge |
| **Member Port 2** | `ether3` | Physical LAN Port 2 assigned to Bridge |

---

## WinBox GUI Configuration Steps

### Step 1: Create the Bridge Interface
1. Navigate to **Bridge** from the WinBox left menu.
2. Under the **Bridge** tab, click the **`+` (Add)** button.
3. Set **Name** to `bridge-lan`.
4. Click **Apply**, then **OK**.

### Step 2: Assign Interfaces to the Bridge
1. Switch to the **Ports** tab inside the **Bridge** window.
2. Click the **`+` (Add)** button.
   - **Interface:** Select `ether2`
   - **Bridge:** Select `bridge-lan`
   - Click **Apply**, then **OK**.
3. Click the **`+` (Add)** button again.
   - **Interface:** Select `ether3`
   - **Bridge:** Select `bridge-lan`
   - Click **Apply**, then **OK**.

---

## Included Artifacts
- `Bridge-config.rsc`: Exported RouterOS configuration script for Lab 05 settings.

## Author
Pritam Barua
