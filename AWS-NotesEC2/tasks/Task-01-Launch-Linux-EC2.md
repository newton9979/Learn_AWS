# 🚀 Task 01 - Launch a Linux EC2 Instance

## 🎯 Objective

Launch your first Amazon EC2 Linux instance using the AWS Management Console and understand every configuration option involved during the launch process.

---

# 📚 Learning Outcomes

After completing this task, you will be able to:

* Launch an EC2 instance
* Choose an Amazon Machine Image (AMI)
* Select an Instance Type
* Create and use a Key Pair
* Configure Network Settings
* Configure Security Groups
* Configure Storage
* Launch and verify an EC2 instance
* Understand each launch configuration

---

# 📋 Prerequisites

Before starting, ensure you have:

* AWS Free Tier Account
* IAM User with EC2 permissions
* Internet connection
* Web Browser

---

# Architecture

```
                AWS Cloud
                     │
          ┌────────────────────┐
          │      Amazon EC2    │
          │                    │
          │  Amazon Linux 2023 │
          │      t2.micro      │
          └─────────┬──────────┘
                    │
             Security Group
              SSH (Port 22)
                    │
             Public IPv4 Address
                    │
             Your Local Computer
```

---

# Step 1 — Login to AWS Console

1. Login to AWS Console
2. Search for **EC2**
3. Open the EC2 Dashboard

Expected Result:

```
AWS Console
    ↓
EC2 Dashboard
```

---

# Step 2 — Click Launch Instance

Navigate to

```
EC2 Dashboard

↓

Instances

↓

Launch Instance
```

---

# Step 3 — Configure Instance Name

Enter a meaningful name.

Example:

```
Linux-WebServer
```

Recommended naming convention

```
<Project>-<Environment>-<Purpose>

Example

dev-linux-server
prod-web-server
test-ec2
```

---

# Step 4 — Select Amazon Machine Image (AMI)

Choose:

```
Amazon Linux 2023
```

Why Amazon Linux?

* AWS optimized
* Free Tier eligible
* Secure
* Frequently updated
* Best for beginners

---

# Step 5 — Select Instance Type

Choose

```
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

```
Create New Key Pair
```

Example

```
linux-keypair
```

Key Pair Type

```
RSA
```

Private Key Format

```
.pem
```

Download the key file and store it securely.

⚠️ Important:

If you lose the `.pem` file, you cannot SSH into the instance.

---

# Step 7 — Configure Network Settings

Click **Edit**

Configuration

```
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

```
linux-sg
```

Inbound Rules

| Type | Protocol | Port | Source |
| ---- | -------- | ---- | ------ |
| SSH  | TCP      | 22   | My IP  |

Why "My IP"?

Only your computer can connect via SSH, making it more secure than allowing access from anywhere.

---

# Step 9 — Configure Storage

Default

```
8 GB gp3
```

Free Tier includes

```
30 GB
```

You can safely increase storage if required.

---

# Step 10 — Review Configuration

Example Summary

```
Name
Linux-WebServer

AMI
Amazon Linux 2023

Instance Type
t2.micro

Storage
8 GB

Security Group
SSH Port 22

Public IP
Enabled
```

---

# Step 11 — Launch Instance

Click

```
Launch Instance
```

AWS will provision the virtual machine.

Expected message

```
Successfully launched instance
```

---

# Step 12 — Verify Instance

Navigate to

```
Instances
```

Check

```
Instance State

↓

Running
```

Also verify

* Public IPv4 Address
* Instance ID
* Availability Zone
* Instance Type

---

# Instance Launch Flow

```
Login AWS

↓

EC2 Dashboard

↓

Launch Instance

↓

Select AMI

↓

Choose Instance Type

↓

Create Key Pair

↓

Network Settings

↓

Security Group

↓

Storage

↓

Launch

↓

Running Instance
```

---

# Verification Checklist

* [ ] AWS Login Successful
* [ ] EC2 Dashboard Opened
* [ ] Amazon Linux Selected
* [ ] t2.micro Selected
* [ ] Key Pair Created
* [ ] Security Group Created
* [ ] SSH Port 22 Allowed
* [ ] Storage Configured
* [ ] Instance Running
* [ ] Public IP Assigned

---

# Common Errors

### Key Pair Not Downloaded

You cannot SSH into the instance.

---

### Security Group Missing SSH

SSH connection will fail.

---

### Public IP Disabled

Instance cannot be accessed from the Internet.

---

### Wrong Region

Instance appears missing because it was launched in another AWS Region.

---

# Best Practices

* Use least privilege IAM permissions.
* Restrict SSH to **My IP** instead of **Anywhere**.
* Tag resources consistently.
* Delete unused EC2 instances to avoid charges.
* Use Amazon Linux for learning and Free Tier practice.
* Stop or terminate idle instances to reduce costs.

---

# Task Completed Successfully ✅

You have successfully:

* Created an EC2 Linux instance
* Configured networking
* Created a Key Pair
* Created a Security Group
* Configured storage
* Launched your first EC2 instance
* Verified that the instance is running

---

## 📌 Next Task

➡️ **Task-02-Launch-Windows-EC2.md**

In the next task, you will learn how to launch a Windows EC2 instance and connect to it using Remote Desktop Protocol (RDP).
