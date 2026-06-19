# 🔐 Task 03 - Connect to a Linux EC2 Instance Using SSH

## 🎯 Objective

Learn how to securely connect to a running Linux EC2 instance using SSH from Windows, Linux, and macOS. Understand how SSH works, common connection issues, and security best practices.

---

# 📚 Learning Outcomes

After completing this task, you will be able to:

* Understand SSH fundamentals
* Locate your EC2 Public IPv4 Address
* Secure your private key (.pem)
* Connect from Windows using PowerShell
* Connect from Windows using Git Bash
* Connect from Linux/macOS Terminal
* Verify a successful SSH login
* Troubleshoot common SSH issues

---

# 📋 Prerequisites

Before starting, ensure you have:

* AWS Account
* Running Linux EC2 Instance
* Public IPv4 Address
* Security Group allowing SSH (Port 22)
* Downloaded Key Pair (.pem)
* Terminal or PowerShell

---

# Architecture

```text
                Your Computer
                      │
                SSH Client
                      │
                Port 22 (TCP)
                      │
                Internet
                      │
        ┌────────────────────────┐
        │ AWS Security Group      │
        │ Allow TCP Port 22       │
        └─────────────┬───────────┘
                      │
              Amazon EC2 Linux
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

Copy the

```text
Public IPv4 Address
```

Example

```text
54.210.xxx.xxx
```

---

# Step 2 — Verify Security Group

Open the attached Security Group.

Ensure the following rule exists:

| Type | Protocol | Port | Source |
| ---- | -------- | ---- | ------ |
| SSH  | TCP      | 22   | My IP  |

Without this rule, SSH connections will fail.

---

# Step 3 — Locate Your Key Pair

Example

```text
linux-keypair.pem
```

Store it in an easy-to-access location.

Example

```text
C:\Users\YourName\Downloads\
```

or

```text
/home/user/keys/
```

---

# Step 4 — Set Correct File Permissions

### Linux/macOS

```bash
chmod 400 linux-keypair.pem
```

### Windows

No permission change is required when using PowerShell or Git Bash, but keep the `.pem` file private and never share it.

---

# Step 5 — Connect Using PowerShell (Windows)

Navigate to the folder containing the key pair.

Run:

```bash
ssh -i "linux-keypair.pem" ec2-user@PUBLIC-IP
```

Example

```bash
ssh -i "linux-keypair.pem" ec2-user@54.210.xxx.xxx
```

---

# Step 6 — Connect Using Git Bash (Windows)

Run the same command:

```bash
ssh -i linux-keypair.pem ec2-user@PUBLIC-IP
```

Example

```bash
ssh -i linux-keypair.pem ec2-user@54.210.xxx.xxx
```

---

# Step 7 — Connect Using Linux/macOS

Open Terminal.

Run

```bash
ssh -i linux-keypair.pem ec2-user@PUBLIC-IP
```

Example

```bash
ssh -i linux-keypair.pem ec2-user@54.210.xxx.xxx
```

---

# Step 8 — Accept SSH Fingerprint

During the first connection, you'll see:

```text
The authenticity of host can't be established.

Are you sure you want to continue connecting?
```

Type

```text
yes
```

Press **Enter**.

AWS stores the host fingerprint for future connections.

---

# Step 9 — Successful Login

You should see a welcome message similar to:

```text
Amazon Linux 2023

Last login: ...

[ec2-user@ip-172-31-xx-xx ~]$
```

You are now connected to your EC2 instance.

---

# Step 10 — Verify Connection

Run the following commands:

Check current user

```bash
whoami
```

Expected Output

```text
ec2-user
```

Check hostname

```bash
hostname
```

Check operating system

```bash
cat /etc/os-release
```

Check current directory

```bash
pwd
```

List files

```bash
ls -la
```

---

# SSH Connection Flow

```text
Start EC2 Instance

↓

Copy Public IPv4 Address

↓

Verify Security Group

↓

Locate .pem File

↓

Open Terminal

↓

Run SSH Command

↓

Accept Fingerprint

↓

Login Successful
```

---

# Common EC2 Usernames

| Operating System         | Default Username |
| ------------------------ | ---------------- |
| Amazon Linux             | ec2-user         |
| Ubuntu                   | ubuntu           |
| Debian                   | admin            |
| CentOS                   | centos           |
| Red Hat Enterprise Linux | ec2-user         |
| SUSE Linux               | ec2-user         |

Using the wrong username will result in an authentication failure.

---

# Troubleshooting

### Permission Denied

```text
Permission denied (publickey)
```

Possible causes:

* Wrong key pair
* Wrong username
* Incorrect key permissions

---

### Connection Timed Out

Possible causes:

* Port 22 blocked
* Incorrect Public IP
* Instance stopped
* Network ACL or firewall restrictions

---

### Host Key Verification Failed

Run:

```bash
ssh-keygen -R PUBLIC-IP
```

Then reconnect.

---

### Lost .pem File

You cannot SSH into the instance using the original key.

You must create a new key pair or recover access using AWS Systems Manager (SSM) or another recovery method.

---

# Best Practices

* Never share your `.pem` file.
* Restrict SSH access to **My IP**.
* Disable unused EC2 instances.
* Rotate SSH keys periodically.
* Use IAM roles instead of storing AWS access keys on the instance.
* Keep your EC2 instance updated with security patches.

---

# Verification Checklist

* [ ] EC2 Instance Running
* [ ] Public IP Available
* [ ] Security Group Allows Port 22
* [ ] Correct Username Used
* [ ] Correct Key Pair Used
* [ ] SSH Connection Successful
* [ ] Verified User with `whoami`
* [ ] Verified Hostname
* [ ] Executed Basic Linux Commands

---

# Task Completed Successfully ✅

You have successfully:

* Connected to a Linux EC2 instance using SSH
* Verified the instance is accessible
* Executed basic Linux commands
* Learned common troubleshooting steps
* Understood SSH security best practices

---

## 📌 Next Task

➡️ **Task-04-Connect-Using-RDP.md**

In the next task, you will learn how to connect to a Windows EC2 instance using Remote Desktop Protocol (RDP), retrieve the Administrator password, and troubleshoot common RDP issues.
