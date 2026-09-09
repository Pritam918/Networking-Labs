# 7. Static Routing Configuration

## Description

This lab demonstrates the configuration of a Static Route on MikroTik RouterOS using the WinBox GUI. Creating a static route enables manual traffic routing between distinct IP subnets by defining specific destination networks and their corresponding gateways or active loopback interfaces.

---

## Objectives

* Define a manual static route for a remote destination subnet (`192.168.20.0/24`).
* Assign a next-hop IP gateway (`10.10.10.2`) as well as a virtual `Loopback-1` interface for reachability verification.
* Establish routing table entry status verification in WinBox GUI.
* Verify connectivity using the built-in WinBox Ping Tool across the configured routes.

---

## Network Configuration Details

| Parameter / Interface | Configured Value | Description |
| :--- | :--- | :--- |
| **LAN Gateway (ether2)** | `10.10.10.1/24` | Local Gateway Interface Address |
| **VLAN-10 Interface** | `10.10.10.1/24` | Local LAN Gateway (Sales Subnet) |
| **VLAN-20 Interface** | `10.10.20.1/24` | Local LAN Gateway (HR Subnet) |
| **Destination Subnet** | `192.168.20.0/24` | Remote target network address |
| **Next-Hop Gateway** | `10.10.10.2` | Forwarding IP address of the next router |
| **Loopback Gateway** | `Loopback-1` | Virtual interface gateway for local ping verification |
| **Route Distance** | `1` | Default administrative distance metric |

---

## WinBox GUI Configuration Steps

### Step 1: Assign Local LAN IP Addresses

1. Navigate to **IP** > **Addresses** from the WinBox left menu.
2. Click the **`+` (Add)** button to assign interface IP addresses:
   * Assign `10.10.10.1/24` to `VLAN-10 SALES`.
   * Assign `10.10.20.1/24` to `VLAN-20 HR`.
3. Click **Apply**, then **OK**.

### Step 2: Open Route List Window

1. Navigate to **IP** > **Routes** from the WinBox left menu.
2. Under the **Routes** tab, click the **`+` (Add)** button.

### Step 3: Add New Static Route (Loopback / Gateway)

1. Set **Dst. Address** to `192.168.20.0/24`.
2. Set **Gateway** to `Loopback-1` (or `10.10.10.2`).
3. Verify that **Immediate Gateway** shows `Loopback-1`.
4. Click **Apply**, then **OK**.

### Step 4: Verify Route Status and Connectivity

1. Confirm the new route entry displays the **`AS`** (Active, Static) or **`DAC`** flag in the Route List window.
2. Navigate to **Tools** > **Ping** from the WinBox left menu.
3. Enter **Ping To**: `192.168.20.1` (or destination address) and click **Start** to verify successful packet delivery (`0% packet loss`).

---

## Included Artifacts

* `static_routing.rsc` : Exported RouterOS configuration script for Lab 07 settings.

---

## Author
Pritam Barua
