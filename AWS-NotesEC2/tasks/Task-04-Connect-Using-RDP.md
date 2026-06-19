# 🖥️ Task 04 - Connect to a Windows EC2 Instance Using RDP

## 🎯 Objective

Learn how to securely connect to a Windows EC2 instance using Remote Desktop Protocol (RDP), retrieve the Administrator password, and troubleshoot common RDP connection issues.

---

# 📚 Learning Outcomes

After completing this task, you will be able to:

* Understand how RDP works
* Retrieve the Windows Administrator password
* Decrypt the password using the Key Pair
* Connect using Remote Desktop Connection (mstsc)
* Verify a successful Windows login
* Troubleshoot common RDP issues
* Apply RDP security best practices

---

# 📋 Prerequisites

Before starting, ensure you have:

* AWS Free Tier Account
* Running Windows EC2 Instance
* Public IPv4 Address
* Security Group allowing RDP (Port 3389)
* Downloaded Key Pair (.pem)
* Windows Remote Desktop Client (mstsc)

---

# Architecture

```text
                 Your Computer
                       │
          Remote Desktop (RDP)
                  TCP Port 3389
                       │
                  Internet
                       │
        ┌────────────────────────┐
        │ AWS Security Group      │
        │ Allow TCP Port 3389     │
        └─────────────┬───────────┘
                      │
           Windows EC2 Instance
```

---

# Step 1 — Verify EC2 Instance

Open

```text
AWS Console

↓

EC2 Dashboard

↓

Instances
```

Verify

```text
Instance State

↓

Running
```

Also verify

* Public IPv4 Address
* Status Checks = 2/2 Passed

---

# Step 2 — Verify Security Group

Open the attached Security Group.

Confirm the following inbound rule exists:

| Type | Protocol | Port | Source |
| ---- | -------- | ---- | ------ |
| RDP  | TCP      | 3389 | My IP  |

Using **My IP** improves security by restricting access to your current network.

---

# Step 3 — Retrieve the Windows Password

Select the EC2 instance.

Navigate to

```text
Connect

↓

RDP Client

↓

Get Password
```

Upload the downloaded key pair.

Example

```text
windows-keypair.pem
```

Click

```text
Decrypt Password
```

AWS displays:

```text
Username

Administrator

Password

************
```

Copy both values securely.

---

# Step 4 — Open Remote Desktop

On Windows

Press

```text
Windows + R
```

Type

```text
mstsc
```

Click

```text
OK
```

---

# Step 5 — Enter Public IP Address

Example

```text
54.210.xxx.xxx
```

Click

```text
Connect
```

---

# Step 6 — Login

Username

```text
Administrator
```

Password

```text
Paste the decrypted password
```

Click

```text
OK
```

---

# Step 7 — Accept Certificate Warning

The first connection may display:

```text
The identity of the remote computer cannot be verified.
```

Click

```text
Yes
```

The Windows desktop will load.

---

# Step 8 — Verify Successful Login

After logging in, verify the following:

* Windows Desktop appears
* Server Manager opens automatically
* Internet connectivity works
* CPU and Memory information are visible

---

# Step 9 — Verify Computer Information

Open

```text
Start

↓

Settings

↓

System

↓

About
```

Verify

* Computer Name
* Windows Edition
* Processor
* Installed RAM

---

# Step 10 — Test Internet Connectivity

Open Command Prompt.

Run

```cmd
ping amazon.com
```

Expected Result

```text
Reply from ...
```

---

# Step 11 — Check Windows Firewall

Navigate to

```text
Control Panel

↓

Windows Defender Firewall
```

Ensure the firewall is enabled.

---

# RDP Connection Flow

```text
Launch Windows EC2

↓

Wait for Initialization

↓

Copy Public IP

↓

Retrieve Administrator Password

↓

Decrypt Password

↓

Open Remote Desktop

↓

Enter Public IP

↓

Administrator Login

↓

Windows Desktop
```

---

# Common RDP Errors

## Password Not Available

Reason:

* Windows is still booting.

Solution:

* Wait 4–8 minutes.
* Refresh and try again.

---

## Unable to Decrypt Password

Reason:

* Wrong Key Pair
* Lost .pem file

Solution:

* Use the original key pair that was selected during instance creation.

---

## Remote Desktop Can't Connect

Possible Causes

* Port 3389 blocked
* Incorrect Public IP
* Instance stopped
* Firewall restrictions
* Network issues

---

## Authentication Failed

Reason

* Incorrect password
* Wrong username

Correct Username

```text
Administrator
```

---

## Connection Timed Out

Possible Causes

* Security Group does not allow RDP
* Corporate firewall blocks Port 3389
* Instance is not running

---

# Security Best Practices

* Restrict RDP access to **My IP**.
* Never allow **0.0.0.0/0** for Port 3389 in production.
* Keep Windows updated.
* Use strong passwords.
* Stop unused instances to reduce costs.
* Delete unused EC2 instances when finished.
* Rotate access credentials regularly.

---

# Verification Checklist

* [ ] Windows EC2 Running
* [ ] Public IP Available
* [ ] Status Checks Passed
* [ ] Security Group Allows Port 3389
* [ ] Administrator Password Retrieved
* [ ] Password Successfully Decrypted
* [ ] Connected Using Remote Desktop
* [ ] Windows Desktop Accessible
* [ ] Internet Connectivity Verified

---

# Interview Questions

### Q1. Which protocol is used to connect to Windows EC2?

**Answer:** Remote Desktop Protocol (RDP)

---

### Q2. Which port does RDP use?

**Answer:** TCP Port **3389**

---

### Q3. How do you obtain the Administrator password?

**Answer:** From the EC2 Console using **Connect → RDP Client → Get Password**, then decrypt it with the original `.pem` key pair.

---

### Q4. Why should RDP be restricted to "My IP"?

**Answer:** It prevents unauthorized access by allowing only your current IP address to connect.

---

# Task Completed Successfully ✅

You have successfully:

* Connected to a Windows EC2 instance using RDP
* Retrieved and decrypted the Administrator password
* Verified Windows login
* Tested network connectivity
* Learned common RDP troubleshooting steps
* Applied Windows EC2 security best practices

---

## 📌 Next Task

➡️ **Task-05-Stop-and-Start-Instance.md**

In the next task, you will learn how to safely stop, start, reboot, and restart EC2 instances, understand billing implications, and know when to use each instance state.
