# 📀 05 - Mounting and Formatting an EBS Volume on Linux

## 📖 Introduction

After attaching an Amazon EBS volume to an EC2 instance, the operating system can detect the disk, but it cannot store files until a filesystem is created and the volume is mounted.

This chapter explains how to:

* Detect the new EBS volume
* Format the volume
* Create a mount point
* Mount the volume
* Configure automatic mounting after reboot

---

## 🏗️ Architecture

![EBS Mount Architecture](../assets/ebs-mount-architecture.png)

### Architecture Flow

```text
EC2 Instance
      │
      ▼
EBS Volume (/dev/xvdf)
      │
      ▼
ext4 Filesystem
      │
      ▼
Mount Point (/data)
```

---

## 🔄 Linux Mount Workflow

![Linux Mount Workflow](../assets/linux-mount-workflow.png)

```text
Attach EBS
    ↓
Detect Disk
    ↓
Format Disk
    ↓
Create Mount Point
    ↓
Mount Volume
    ↓
Verify Access
    ↓
Configure fstab
```

---

# Step 1: Verify Attached EBS Volume

Connect to your EC2 instance:

```bash
ssh -i mykey.pem ec2-user@PUBLIC-IP
```

Check available block devices:

```bash
lsblk
```

Example Output:

```text
NAME    SIZE TYPE MOUNTPOINT
xvda      8G disk
└─xvda1   8G part /

xvdf     10G disk
```

### Explanation

| Device | Purpose                   |
| ------ | ------------------------- |
| xvda   | Root EBS Volume           |
| xvda1  | Root Partition            |
| xvdf   | Newly Attached EBS Volume |

---

# Step 2: Create a Filesystem

## Why Formatting Is Required

![Filesystem Formatting](../assets/filesystem-formatting.png)

Before formatting:

```text
/dev/xvdf
│
└── Raw Disk
```

After formatting:

```text
/dev/xvdf
│
└── ext4 Filesystem
     ├── Files
     ├── Directories
     └── Permissions
```

Create an ext4 filesystem:

```bash
sudo mkfs -t ext4 /dev/xvdf
```

or

```bash
sudo mkfs.ext4 /dev/xvdf
```

Expected Output:

```text
Creating filesystem...
Writing superblocks...
Filesystem UUID created
```

---

# Step 3: Create a Mount Point

A mount point is a directory where the EBS volume becomes accessible.

Create a directory:

```bash
sudo mkdir /data
```

Verify:

```bash
ls /
```

Output:

```text
bin boot data dev etc home tmp usr var
```

---

# Step 4: Mount the Volume

Mount the filesystem:

```bash
sudo mount /dev/xvdf /data
```

### Mount Process

```text
/dev/xvdf
      │
      ▼
ext4 Filesystem
      │
      ▼
/data
```

---

# Step 5: Verify the Mount

Check mounted filesystems:

```bash
df -h
```

Example Output:

```text
Filesystem      Size Used Avail Mounted on
/dev/xvda1       8G  2G    6G   /
/dev/xvdf       10G  24M   10G  /data
```

Verify block devices:

```bash
lsblk
```

Output:

```text
xvdf 10G disk
└─ mounted on /data
```

---

# Step 6: Test the Volume

Create a test file:

```bash
sudo touch /data/test.txt
```

Verify:

```bash
ls /data
```

Output:

```text
test.txt
```

This confirms that the EBS volume is writable.

---

# Step 7: Find the UUID

Display block device information:

```bash
sudo blkid
```

Example:

```text
/dev/xvdf: UUID="1234-abcd-5678"
TYPE="ext4"
```

Copy the UUID value.

---

# Step 8: Configure Automatic Mounting

## Why fstab Is Required

![fstab Persistence](../assets/fstab-persistence.png)

Without fstab:

```text
Reboot
   ↓
Volume Not Mounted
```

With fstab:

```text
Reboot
   ↓
Volume Mounted Automatically
   ↓
/data Available
```

Open fstab:

```bash
sudo vi /etc/fstab
```

Add:

```text
UUID=1234-abcd-5678 /data ext4 defaults,nofail 0 2
```

Save and exit.

---

# Step 9: Test fstab

Unmount the volume:

```bash
sudo umount /data
```

Reload all mounts:

```bash
sudo mount -a
```

Verify:

```bash
df -h
```

If the volume mounts successfully, the fstab entry is correct.

---

# Why Use UUID Instead of Device Name?

Avoid:

```text
/dev/xvdf
```

Device names may change after reboot.

Recommended:

```text
UUID=1234-abcd-5678
```

UUID remains constant.

---

# Complete Workflow

```text
Attach EBS
    ↓
lsblk
    ↓
mkfs.ext4 /dev/xvdf
    ↓
mkdir /data
    ↓
mount /dev/xvdf /data
    ↓
df -h
    ↓
blkid
    ↓
Update /etc/fstab
    ↓
mount -a
```

---

# Troubleshooting

## Disk Not Visible

```bash
lsblk
```

```bash
sudo fdisk -l
```

---

## Mount Failed

Create mount point:

```bash
sudo mkdir -p /data
```

---

## fstab Errors

Always test before reboot:

```bash
sudo mount -a
```

---

# Interview Questions

### Which command displays attached disks?

```bash
lsblk
```

### Which command creates an ext4 filesystem?

```bash
mkfs.ext4
```

### Which command shows mounted filesystems?

```bash
df -h
```

### Which file controls automatic mounting?

```text
/ etc / fstab
```

### Why is UUID preferred?

Because device names may change after reboot.

---

# 📚 Summary

* Attached EBS volumes appear as block devices.
* A filesystem must be created before use.
* Mount points provide access to storage.
* `df -h` verifies mounted volumes.
* `/etc/fstab` enables automatic mounting.
* UUID is preferred over device names for persistence.

➡️ Next Chapter: **06-Resize-EBS-Volume.md**


![EBS Mount Architecture](../assets/ebs-mount-architecture.png)

![Linux Mount Workflow](../assets/linux-mount-workflow.png)

![Filesystem Formatting](../assets/filesystem-formatting.png)

![fstab Persistence](../assets/fstab-persistence.png)
