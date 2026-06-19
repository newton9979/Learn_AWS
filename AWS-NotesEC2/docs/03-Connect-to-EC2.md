# 03 – Connect to an Amazon EC2 Instance

## 🎯 Objective

After launching an EC2 instance, the next step is to connect to it and start using the operating system.

AWS provides different connection methods based on the operating system.

* **Linux EC2** → SSH
* **Windows EC2** → Remote Desktop Protocol (RDP)

---

# Prerequisites

Before connecting to an EC2 instance, ensure you have:

* ✅ Running EC2 instance
* ✅ Public IPv4 address or Public DNS
* ✅ Security Group allowing required ports
* ✅ Key Pair (.pem file)
* ✅ Internet connection

---

# Connection Methods

| Operating System | Protocol | Default Port |
| ---------------- | -------- | ------------ |
| Linux            | SSH      | 22           |
| Windows          | RDP      | 3389         |

---

# Connecting to a Linux EC2 Instance

## Step 1 – Locate the Public IP

AWS Console

**EC2 → Instances → Select Instance**

Copy:

* Public IPv4 Address
  or
* Public DNS

Example:

```text
54.201.100.25
```

---

## Step 2 – Open Terminal

### Windows

Use:

* PowerShell
* Windows Terminal
* Git Bash
* PuTTY (optional)

### Linux/macOS

Open Terminal.

---

## Step 3 – Move to the Key Pair Location

Example:

```bash
cd Downloads
```

---

## Step 4 – Set Permission (Linux/macOS)

```bash
chmod 400 my-key.pem
```

Windows users can skip this step.

---

## Step 5 – Connect Using SSH

Amazon Linux

```bash
ssh -i my-key.pem ec2-user@54.201.100.25
```

Ubuntu

```bash
ssh -i my-key.pem ubuntu@54.201.100.25
```

RHEL

```bash
ssh -i my-key.pem ec2-user@54.201.100.25
```

Debian

```bash
ssh -i my-key.pem admin@54.201.100.25
```

---

## Successful Login

Example output:

```text
Last login: Tue Jun 10

[ec2-user@ip-172-31-10-20 ~]$
```

You are now connected to the EC2 instance.

---

# Connecting to a Windows EC2 Instance

## Step 1 – Select the Instance

Go to

```
EC2 Console
```

Select your Windows instance.

---

## Step 2 – Get Administrator Password

Choose:

```
Connect
```

↓

```
RDP Client
```

↓

```
Get Password
```

Upload the same **.pem** key used during launch.

AWS decrypts the Administrator password.

---

## Step 3 – Download the RDP File

Click

```
Download Remote Desktop File
```

---

## Step 4 – Open Remote Desktop

Double-click the downloaded `.rdp` file.

Enter:

* Username: `Administrator`
* Password: (decrypted password)

Click **Connect**.

---

# Security Group Requirements

### Linux

| Port | Purpose |
| ---- | ------- |
| 22   | SSH     |

### Windows

| Port | Purpose |
| ---- | ------- |
| 3389 | RDP     |

---

# Default Usernames

| AMI          | Username      |
| ------------ | ------------- |
| Amazon Linux | ec2-user      |
| Ubuntu       | ubuntu        |
| RHEL         | ec2-user      |
| Debian       | admin         |
| CentOS       | centos        |
| Fedora       | fedora        |
| Windows      | Administrator |

---

# Common SSH Command

```bash
ssh -i my-key.pem ec2-user@<Public-IP>
```

Example

```bash
ssh -i my-key.pem ec2-user@54.201.100.25
```

---

# Common Connection Errors

## Permission denied (publickey)

Reason:

* Wrong key pair
* Incorrect username
* Key permission issue

Solution:

* Verify the correct `.pem` file
* Use the correct default username
* Run `chmod 400 my-key.pem` on Linux/macOS

---

## Connection timed out

Reason:

* Port 22 or 3389 is blocked
* Instance is stopped
* Incorrect Security Group rules

Solution:

* Ensure the instance is running
* Allow SSH (22) or RDP (3389) from your IP address
* Verify the Public IP address

---

## Host key verification failed

Reason:

The server's SSH key has changed.

Solution:

Remove the old host entry:

```bash
ssh-keygen -R <Public-IP>
```

---

# Best Practices

* Never share your `.pem` key file.
* Restrict Security Group access to your own IP.
* Close unused ports.
* Use SSH instead of password authentication for Linux.
* Stop or terminate unused EC2 instances to reduce costs.
* Consider using AWS Systems Manager Session Manager to connect without opening SSH ports.

---

# Interview Questions

### Q1. Which protocol is used to connect to Linux EC2?

**Answer:** SSH (Port 22)

---

### Q2. Which protocol is used to connect to Windows EC2?

**Answer:** RDP (Port 3389)

---

### Q3. What is the default username for Amazon Linux?

**Answer:** `ec2-user`

---

### Q4. Which file is required for SSH authentication?

**Answer:** `.pem` key pair

---

### Q5. Why do we use `chmod 400` on the key file?

**Answer:** It restricts permissions so only the owner can read the private key, which SSH requires for security.

---

# Summary

In this chapter, you learned:

* How to connect to Linux EC2 using SSH
* How to connect to Windows EC2 using RDP
* Default usernames for common AMIs
* Required Security Group ports
* Common connection issues and solutions
* Best practices for secure access

➡️ **Next Chapter:** `04-EC2-Instance-Lifecycle.md`
