# 📦 02 - What is Amazon Elastic Block Store (EBS)?

## 📖 What is Amazon EBS?

**Amazon Elastic Block Store (Amazon EBS)** is a **high-performance, persistent block storage service** provided by AWS for use with **Amazon EC2 instances**.

An EBS volume acts like a **virtual hard disk (HDD/SSD)** that you can attach to an EC2 instance. It provides durable storage for operating systems, applications, databases, log files, and other data that must remain available even if the EC2 instance is stopped or restarted.

Unlike temporary instance storage, Amazon EBS is designed to retain data independently of the EC2 instance's power state, making it ideal for production workloads.

---

# 💡 Simple Definition

> **Amazon EBS is a persistent block storage service that provides virtual disk volumes for Amazon EC2 instances.**

Think of it as adding a new SSD or hard drive to a physical server, except the storage is managed by AWS.

---

# 🏢 Real-World Analogy

Imagine a desktop computer:

| Physical World        | AWS Equivalent      |
| --------------------- | ------------------- |
| Computer              | Amazon EC2 Instance |
| SSD / Hard Disk       | Amazon EBS Volume   |
| Files & Applications  | Data stored on EBS  |
| External Backup Drive | EBS Snapshot        |

If you restart your computer, the files stored on the SSD remain available. Similarly, data stored on an EBS volume persists when an EC2 instance is stopped and started.

---

# ⚙️ How Amazon EBS Works

1. Launch an EC2 instance.
2. Create an EBS volume in the same Availability Zone.
3. Attach the EBS volume to the EC2 instance.
4. Partition (if needed), format, and mount the volume.
5. Read and write data just like a local disk.
6. Create snapshots for backup and disaster recovery.

---

# 🧱 Why is it Called Block Storage?

Amazon EBS stores data in **fixed-size blocks** rather than as complete files or objects.

When an application needs data:

* The operating system requests the required data blocks.
* The EBS volume returns only those blocks.
* The operating system combines the blocks to reconstruct the file.

This block-level access provides low latency and high performance, making EBS ideal for databases, operating systems, and enterprise applications.

---

# ⭐ Key Characteristics

* Persistent storage
* Block-level storage
* Low-latency performance
* High durability
* Multiple volume types
* Online volume resizing
* Snapshot support
* Encryption using AWS KMS
* High availability within an Availability Zone
* Seamless integration with Amazon EC2

---

# 🌍 Common Use Cases

Amazon EBS is widely used for:

* Boot volumes for EC2 instances
* Linux and Windows operating systems
* Relational databases (MySQL, PostgreSQL, Oracle)
* NoSQL databases
* Enterprise applications
* Web servers
* Application servers
* Log storage
* Backup and disaster recovery

---

# 📌 Advantages

* Persistent storage
* Fast block-level access
* Easy to resize
* Snapshot-based backups
* Secure encryption
* Reliable performance
* Multiple storage options
* Cost-effective for production workloads

---

# ⚠️ Important Notes

* An EBS volume belongs to a single **Availability Zone (AZ)**.
* An EBS volume can only be attached to EC2 instances in the **same AZ**.
* Most EBS volumes can be attached to one EC2 instance at a time (with limited exceptions such as Multi-Attach for supported workloads).
* EBS snapshots are incremental and managed by AWS.
* You can increase the size of an EBS volume, but reducing its size requires creating a new, smaller volume and migrating the data.

---

# 🎯 Interview Questions

### 1. What is Amazon EBS?

Amazon EBS is a persistent block storage service that provides virtual disk volumes for Amazon EC2 instances.

---

### 2. Is Amazon EBS persistent?

✅ Yes. Data remains available even after the EC2 instance is stopped and started.

---

### 3. Can an EBS volume be resized?

✅ Yes. You can increase its size and then extend the file system within the operating system.

---

### 4. Is Amazon EBS shared across Availability Zones?

❌ No. An EBS volume is created within a single Availability Zone.

---

### 5. Can EBS be used without EC2?

No. Amazon EBS is designed to be attached to Amazon EC2 instances.

---

# 📝 Summary

Amazon Elastic Block Store (EBS) is one of the core storage services in AWS. It provides reliable, persistent, and high-performance block storage for EC2 instances. Because it supports resizing, snapshots, encryption, and multiple performance tiers, EBS is the preferred storage solution for operating systems, databases, and production applications running on Amazon EC2.

---

## 📚 Next Chapter

➡️ **03 - Amazon EBS Volume Types**

In the next chapter, you'll learn about:

* gp3 (General Purpose SSD)
* gp2 (Previous Generation SSD)
* io2 and io1 (Provisioned IOPS SSD)
* st1 (Throughput Optimized HDD)
* sc1 (Cold HDD)
* Performance comparison
* IOPS and throughput
* Cost optimization
* Best use cases for each volume type

