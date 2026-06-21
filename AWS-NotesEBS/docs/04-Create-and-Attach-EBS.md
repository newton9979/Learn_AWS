# 📀 04 - Create and Attach an Amazon EBS Volume

## 📖 Introduction

An Amazon EBS volume is a network-attached storage device that provides persistent block storage for EC2 instances.

Think of an EBS volume as an external hard disk that can be attached to an EC2 server. Unlike instance store volumes, data on EBS remains available even when the EC2 instance is stopped.

---

# 🎯 Why Do We Need Additional EBS Volumes?

When an EC2 instance is launched, AWS automatically creates a root volume.

However, many workloads require additional storage:

* Database files
* Application logs
* Backup data
* Shared datasets
* Separate storage for applications

Example:

```text
Root Volume (20 GB)
│
├── Operating System
├── Boot Files
└── System Configuration

Additional EBS Volume (100 GB)
│
├── Database Files
├── Logs
└── Application Data
```

---

# 🏗️ Architecture Overview

```text
+----------------------+
|      EC2 Server      |
|    Amazon Linux      |
+----------+-----------+
           |
           |
           ▼
+----------------------+
|     EBS Volume       |
|       gp3 SSD        |
|       10 GiB         |
+----------------------+
```

The EC2 instance accesses the EBS volume over the AWS network.

---

# 📌 Workflow

```text
Create Volume
      │
      ▼
Attach to EC2
      │
      ▼
OS Detects Disk
      │
      ▼
Create Filesystem
      │
      ▼
Mount Volume
      │
      ▼
Store Data
```

This chapter covers the first two steps.

---

# Step 1: Create an EBS Volume

Navigate to:

EC2 Console → Elastic Block Store → Volumes

Click:

Create Volume

---

## Example Configuration

| Setting           | Value      |
| ----------------- | ---------- |
| Volume Type       | gp3        |
| Size              | 10 GiB     |
| Availability Zone | us-east-1a |
| Encryption        | Disabled   |

### Why gp3?

AWS recommends gp3 because:

* Better price-performance
* Independent IOPS configuration
* Independent throughput configuration
* Suitable for most workloads

---

# Step 2: Select the Correct Availability Zone

Important:

An EBS volume can only be attached to an EC2 instance in the same Availability Zone.

Example:

```text
EC2 Instance → us-east-1a
EBS Volume  → us-east-1a
```

Valid ✅

```text
EC2 Instance → us-east-1a
EBS Volume  → us-east-1b
```

Invalid ❌

---

# Step 3: Attach the Volume

After the volume is created:

Volumes → Select Volume → Actions → Attach Volume

Choose:

* Target EC2 Instance
* Device Name

Example:

```bash
/dev/xvdf
```

---

# What Happens Internally?

```text
AWS Storage Network
          │
          ▼
+----------------------+
|     EBS Volume       |
+----------------------+
          │
          ▼
+----------------------+
|     EC2 Instance     |
+----------------------+
```

AWS creates a network connection between the EC2 instance and the EBS volume.

To Linux, the volume appears as a new disk.

---

# Step 4: Verify from Linux

Connect to EC2:

```bash
ssh -i mykey.pem ec2-user@PUBLIC-IP
```

Check attached disks:

```bash
lsblk
```

Example:

```text
NAME    SIZE TYPE
xvda      8G disk
└─xvda1   8G part

xvdf     10G disk
```

### Explanation

```text
xvda
```

Root volume attached during EC2 launch.

```text
xvdf
```

New EBS volume attached manually.

---

# Visualizing the Linux View

Before attaching:

```text
+------------------+
| xvda (Root Disk) |
+------------------+
```

After attaching:

```text
+------------------+
| xvda (Root Disk) |
+------------------+

+------------------+
| xvdf (New Disk)  |
+------------------+
```

Linux now sees two disks.

---

# Real-World Example

Suppose you run a MySQL database.

Instead of storing database files on the root volume:

```text
Root Volume
├── Linux OS
└── System Files

EBS Volume
├── MySQL Data
├── Logs
└── Backups
```

Benefits:

* Easier backups
* Better storage management
* Independent scaling
* Improved reliability

---

# Common Interview Questions

### Why attach a separate EBS volume?

To separate application data from the operating system and allow independent scaling.

---

### Can an EBS volume survive an EC2 stop?

Yes.

EBS provides persistent storage.

---

### Can an EBS volume be attached across Availability Zones?

No.

The volume and EC2 instance must be in the same Availability Zone.

---

# Summary

✅ Created an EBS volume

✅ Selected the correct Availability Zone

✅ Attached the volume to EC2

✅ Verified the new disk using lsblk

✅ Learned how EC2 communicates with EBS

➡️ Next Chapter: Mounting and Formatting the EBS Volume on Linux

