# 8. Firewall Filter Rules Configuration

## Description

This lab demonstrates the configuration of Firewall Filter Rules on MikroTik RouterOS using the WinBox GUI. Implementing filter rules allows network administrators to secure the router and internal network by controlling incoming, outgoing, and transit traffic based on protocols, IP addresses, and specific traffic chains.

---

## Objectives

* Define and configure an active Firewall Filter Rule in RouterOS.
* Block incoming ICMP (Ping) traffic targeted at the router (`input` chain).
* Verify packet filtering mechanics by observing real-time byte and packet counters.
* Test and validate traffic drop action using the built-in WinBox Ping Tool and CLI terminal commands.

---

## Network Configuration Details

| Parameter / Field | Configured Value | Description |
| :--- | :--- | :--- |
| **Chain** | `input` | Filters traffic directed to the router itself |
| **Protocol** | `icmp` | Internet Control Message Protocol (Ping traffic) |
| **Action** | `drop` | Silently discards matching network packets |
| **Target Interface / IP** | `10.10.10.1` | Local Router Gateway IP Address |
| **Comment** | `Block ICMP Ping Traffic` | Descriptive identification tag for rule management |

---

## WinBox GUI Configuration Steps

### Step 1: Open Firewall Filter Rules Window

1. Navigate to **IP** > **Firewall** from the WinBox left menu.
2. Under the **Filter Rules** tab, click the **`+` (Add)** button.

### Step 2: Define Match Conditions

1. In the **General** tab, select **Chain** as `input`.
2. Select **Protocol** as `icmp`.

### Step 3: Configure Action and Save

1. Switch to the **Action** tab.
2. Set **Action** to `drop`.
3. Add a **Comment**: `Block ICMP Ping Traffic`.
4. Click **Apply**, then **OK**.

### Step 4: Verify Firewall Rule Execution & Packet Loss

1. Navigate to **Tools** > **Ping** from the WinBox left menu.
2. Set **Ping To**: `10.10.10.1` (or local router gateway IP) and click **Start**.
3. Confirm that traffic is actively blocked resulting in `100% packet loss` (`timeout`).
4. Re-open **IP** > **Firewall** > **Filter Rules** and confirm that the **Packets** and **Bytes** counters increment for the rule.

---

## CLI Verification Command

To print active firewall rules with packet statistics via MikroTik Terminal:

```routeros
/ip firewall filter print stats

## Author
Pritam Barua
