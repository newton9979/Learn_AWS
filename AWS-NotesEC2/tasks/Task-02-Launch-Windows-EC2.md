# 🖥️ Task 02 - Launch a Windows EC2 Instance

## 🎯 Objective

Launch a Microsoft Windows Server EC2 instance using the AWS Management Console and understand the configuration required to connect using Remote Desktop Protocol (RDP).

---

# 📚 Learning Outcomes

After completing this task, you will be able to:

* Launch a Windows EC2 instance
* Select a Windows Amazon Machine Image (AMI)
* Choose the appropriate instance type
* Create and use a Key Pair
* Configure Security Groups for RDP
* Configure Storage
* Launch a Windows instance
* Retrieve the Windows Administrator Password
* Understand the Windows EC2 boot process

---

# 📋 Prerequisites

Before starting, ensure you have:

* AWS Free Tier Account
* IAM User with EC2 permissions
* Internet connection
* Remote Desktop Connection (mstsc) on Windows
* AWS Console access

---

# Architecture

```text
                AWS Cloud
                     │
         ┌──────────────────────────┐
         │      Amazon EC2          │
         │                          │
         │ Windows Server 2022 Base │
         │        t2.micro          │
         └───────────┬──────────────┘
                     │
             Security Group
              RDP (Port 3389)
                     │
             Public IPv4 Address
                     │
          Windows Remote Desktop
                     │
              Your Local Computer
```

---

# Step 1 — Login to AWS Console

Login to your AWS Account.

Navigate to

```text
AWS Console

↓

EC2 Dashboard
```

---

# Step 2 — Click Launch Instance

Navigate to

```text
EC2 Dashboard

↓

Instances

↓

Launch Instance
```

---

# Step 3 — Configure Instance Name

Example

```text
Windows-WebServer
```

Recommended Naming

```text
<Project>-<OS>-<Purpose>

Examples

dev-windows-server
prod-rdp-server
test-windows
```

---

# Step 4 — Select Amazon Machine Image (AMI)

Choose

```text
Microsoft Windows Server 2022 Base
```

Why Windows Server?

* Official Microsoft Image
* AWS Managed
* Frequently Updated
* Secure
* Suitable for IIS, .NET, SQL Server, and Windows applications

---

# Step 5 — Select Instance Type

Choose

```text
t2.micro
```

Specifications

| Resource  | Value |
| --------- | ----- |
| vCPU      | 1     |
| RAM       | 1 GB  |
| Free Tier | ✅ Yes |

---

# Step 6 — Create a Key Pair

Click

```text
Create New Key Pair
```

Example

```text
windows-keypair
```

Configuration

```text
Key Pair Type

↓

RSA

↓

Private Key Format

↓

.pem
```

Download and save the key securely.

⚠️ This `.pem` file is required later to decrypt the Windows Administrator password.

---

# Step 7 — Configure Network Settings

Click **Edit**

Configuration

```text
VPC

↓

Default VPC

↓

Subnet

↓

Default

↓

Auto Assign Public IP

↓

Enable
```

---

# Step 8 — Configure Security Group

Create a new Security Group.

Example

```text
windows-rdp-sg
```

Inbound Rules

| Type | Protocol | Port | Source |
| ---- | -------- | ---- | ------ |
| RDP  | TCP      | 3389 | My IP  |

Why "My IP"?

Only your computer will be able to connect through Remote Desktop, improving security.

---

# Step 9 — Configure Storage

Recommended

```text
30 GB gp3
```

Windows requires more storage than Linux because of the operating system files and updates.

---

# Step 10 — Review Configuration

Example Summary

```text
Name
Windows-WebServer

AMI
Windows Server 2022 Base

Instance Type
t2.micro

Storage
30 GB

Security Group
RDP Port 3389

Public IP
Enabled
```

---

# Step 11 — Launch Instance

Click

```text
Launch Instance
```

AWS begins provisioning the Windows virtual machine.

Expected Message

```text
Successfully launched instance
```

---

# Step 12 — Wait for Windows Initialization

Windows takes longer to start than Linux.

Wait approximately

```text
4–8 Minutes
```

Verify

```text
Instance State

↓

Running

↓

Status Checks

↓

2/2 Checks Passed
```

---

# Step 13 — Retrieve Windows Administrator Password

Select your instance.

Click

```text
Connect

↓

RDP Client

↓

Get Password
```

Upload the downloaded

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

# Step 14 — Connect Using Remote Desktop

Open

```text
Remote Desktop Connection (mstsc)
```

Enter

```text
Public IPv4 Address
```

Click

```text
Connect
```

Enter

```text
Username

Administrator

Password

(Decrypted Password)
```

Accept the certificate warning.

You should now see the Windows desktop.

---

# Windows EC2 Launch Flow

```text
Login AWS

↓

EC2 Dashboard

↓

Launch Instance

↓

Select Windows AMI

↓

Choose Instance Type

↓

Create Key Pair

↓

Configure Security Group

↓

Configure Storage

↓

Launch Instance

↓

Wait for Initialization

↓

Decrypt Password

↓

Connect via RDP
```

---

# Verification Checklist

* [ ] AWS Login Successful
* [ ] Windows AMI Selected
* [ ] t2.micro Selected
* [ ] Key Pair Created
* [ ] Security Group Created
* [ ] RDP Port 3389 Allowed
* [ ] Public IP Assigned
* [ ] Instance Running
* [ ] Status Checks Passed
* [ ] Administrator Password Retrieved
* [ ] Connected Using Remote Desktop

---

# Common Errors

### Waiting Less Than 5 Minutes

The Administrator password may not yet be available.

---

### Lost Key Pair

You cannot decrypt the Windows password.

---

### Port 3389 Blocked

Remote Desktop connection will fail.

---

### Wrong Public IP

Unable to connect to the correct instance.

---

### Firewall Restrictions

Corporate or local firewalls may block RDP traffic.

---

# Best Practices

* Restrict RDP access to **My IP**.
* Never expose Port 3389 to the entire Internet (`0.0.0.0/0`).
* Use strong passwords.
* Stop unused Windows instances to reduce costs.
* Apply Windows updates regularly.
* Delete unused instances to avoid unnecessary charges.

---

# Task Completed Successfully ✅

You have successfully:

* Launched a Windows EC2 instance
* Configured networking
* Created a Key Pair
* Configured an RDP Security Group
* Retrieved the Administrator password
* Connected using Remote Desktop
* Verified the instance is operational

---

## 📌 Next Task

➡️ **Task-03-Connect-Using-SSH.md**

In the next task, you will learn how to securely connect to a Linux EC2 instance using SSH from Windows, Linux, and macOS.
