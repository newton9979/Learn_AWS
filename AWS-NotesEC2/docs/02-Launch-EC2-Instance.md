# Launch an Amazon EC2 Instance

## 📖 Table of Contents

* Objective
* Prerequisites
* EC2 Launch Workflow
* Step 1: Open EC2 Dashboard
* Step 2: Configure Instance Details
* Step 3: Create Key Pair
* Step 4: Configure Security Group
* Step 5: Launch Instance
* Verify Instance Status
* Connect to the Instance
* Common Issues
* Best Practices
* Key Takeaways
* Interview Questions

---

# 🎯 Objective

In this lab, you will learn how to launch your first Amazon EC2 instance using the AWS Management Console.

By the end of this exercise, you will:

* Launch a Linux EC2 instance
* Configure Security Groups
* Create a Key Pair
* Understand launch settings
* Verify instance status

---

# 📋 Prerequisites

Before starting, ensure you have:

* AWS Account
* IAM User with EC2 permissions
* Internet Connection
* Web Browser

---

# 📊 EC2 Launch Workflow

```text
AWS Console
     │
     ▼
EC2 Dashboard
     │
     ▼
Launch Instance
     │
     ▼
Select AMI
     │
     ▼
Choose Instance Type
     │
     ▼
Create Key Pair
     │
     ▼
Configure Security Group
     │
     ▼
Launch Instance
     │
     ▼
Running State
```

---

# Step 1: Open EC2 Dashboard

1. Login to AWS Console.
2. Search for **EC2** in the search bar.
3. Click **EC2** service.

You will see the EC2 Dashboard.

📸 Screenshot:

```text
images/ec2-dashboard.png
```

---

# Step 2: Launch Instance

Click:

```text
Instances → Launch Instances
```

You will be redirected to the launch wizard.

---

# Step 3: Configure Basic Details

## Instance Name

Example:

```text
My-First-EC2
```

Choose a meaningful name.

---

## Select Amazon Machine Image (AMI)

Choose:

```text
Amazon Linux 2023 AMI
```

Other options:

* Ubuntu
* Red Hat
* SUSE Linux
* Windows Server

---

## Choose Instance Type

For Free Tier:

```text
t2.micro
```

or

```text
t3.micro
```

These provide:

* 1 vCPU
* 1 GB RAM

---

# Step 4: Create a Key Pair

A Key Pair is required for secure access.

Click:

```text
Create New Key Pair
```

Example:

```text
my-ec2-key
```

Format:

```text
.pem
```

Download and store it securely.

⚠️ AWS will not allow you to download the private key again.

---

# Step 5: Configure Network Settings

Create a Security Group.

Example:

```text
Security Group Name:
ec2-security-group
```

---

## Allow SSH Access

For Linux:

```text
SSH
Port: 22
Source: My IP
```

---

## Allow HTTP Access

For Web Servers:

```text
HTTP
Port: 80
Source: Anywhere
```

---

## Allow HTTPS Access

```text
HTTPS
Port: 443
Source: Anywhere
```

---

# Security Group Example

| Type  | Port | Purpose            |
| ----- | ---- | ------------------ |
| SSH   | 22   | Remote Login       |
| HTTP  | 80   | Web Traffic        |
| HTTPS | 443  | Secure Web Traffic |

---

# Step 6: Configure Storage

Default Storage:

```text
8 GB gp3
```

You can increase storage if needed.

Example:

```text
20 GB
50 GB
100 GB
```

AWS uses Amazon EBS volumes.

---

# Step 7: Launch Instance

Review all settings.

Click:

```text
Launch Instance
```

AWS will begin provisioning your server.

---

# Verify Instance Status

Navigate to:

```text
EC2 → Instances
```

Check:

```text
Instance State = Running
```

Status Checks:

```text
2/2 checks passed
```

Example:

```text
Running
```

📸 Screenshot:

```text
images/running-instance.png
```

---

# Instance Details Explained

| Parameter      | Description                 |
| -------------- | --------------------------- |
| Instance ID    | Unique identifier           |
| Public IP      | Internet accessible address |
| Private IP     | Internal VPC address        |
| AMI            | Operating System Image      |
| Instance Type  | Hardware configuration      |
| Security Group | Virtual Firewall            |

---

# Connect to Instance

Once the instance is running, you can connect using:

### Linux

```bash
ssh -i my-ec2-key.pem ec2-user@PUBLIC-IP
```

### Ubuntu

```bash
ssh -i my-ec2-key.pem ubuntu@PUBLIC-IP
```

---

# Common Issues

## Connection Timeout

Possible Causes:

* Port 22 blocked
* Incorrect Security Group
* Wrong Public IP

---

## Permission Denied

Possible Causes:

* Wrong key file
* Incorrect username

---

## Instance Not Reachable

Check:

* Security Group
* Network ACL
* Route Tables
* Internet Gateway

---

# 💡 Best Practices

### Use Least Privilege

Only open required ports.

Good:

```text
22 → My IP
80 → Anywhere
443 → Anywhere
```

Avoid:

```text
22 → 0.0.0.0/0
```

---

### Use Meaningful Names

Example:

```text
dev-web-server
prod-app-server
jenkins-server
```

---

### Enable Monitoring

Use Amazon CloudWatch to monitor:

* CPU
* Memory
* Disk
* Network

---

### Regularly Patch Instances

Keep Linux and Windows servers updated.

---

# 📌 Key Takeaways

* EC2 instances can be launched in minutes.
* AMI defines the operating system.
* Instance Type defines CPU and RAM.
* Security Groups act as virtual firewalls.
* Key Pairs provide secure access.
* EBS provides persistent storage.

---

# ❓ Interview Questions

### 1. What are the mandatory steps to launch an EC2 instance?

* Select AMI
* Choose Instance Type
* Configure Security Group
* Create or Select Key Pair
* Launch Instance

---

### 2. What is the purpose of a Key Pair?

A Key Pair is used to securely connect to an EC2 instance.

---

### 3. What happens if you lose the private key?

You cannot directly access the instance using SSH.

---

### 4. Which port is used for SSH?

```text
22
```

---

### 5. Which port is used for HTTP?

```text
80
```

---

### 6. Which port is used for HTTPS?

```text
443
```

---

# ⏭️ Next Topic

➡️ **03-Connect-to-EC2.md**

In the next chapter, you'll learn how to connect to Linux and Windows EC2 instances using SSH and RDP.
