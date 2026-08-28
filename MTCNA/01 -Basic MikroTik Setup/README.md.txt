# 01. Basic MikroTik Setup

## Description
This lab covers the essential initial configuration required for securing and organizing a new MikroTik RouterOS device.

## Objectives
- Set custom Router Identity (Host Name).
- Secure the default `admin` account with a strong password.
- Disable unused IP services to prevent unauthorized access and minimize security vulnerabilities.
- Configure Timezone and NTP (Network Time Protocol) Client for accurate system logging.

## Network & System Details
- **Router Identity:** MTCNA-R1
- **Time Zone:** Asia/Dhaka
- **NTP Server:** time.google.com
- **Allowed Services:** WinBox, SSH

## Commands Executed

### 1. Set Router Identity
/system identity set name=MTCNA-R1

### 2. Disable Unused IP Services
/ip service disable api,api-ssl,ftp,telnet,www

### 3. Timezone & NTP Configuration
/system clock set time-zone-name=Asia/Dhaka
/system ntp client set enabled=yes
/system ntp client servers add address=time.google.com

## Verification Commands
To verify the configuration status in the RouterOS CLI:

# Verify Router Name
/system identity print

# Check status of IP Services
/ip service print

# Check Clock and Timezone status
/system clock print

# Check NTP Client status
/system ntp client print

## Included Artifacts
- `01-Basic-setup.rsc`: Complete router script export file for Lab 01.


