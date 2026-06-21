# 📦 01 - Introduction to Amazon Elastic Block Store (EBS)

## 📖 Overview

Amazon Elastic Block Store (Amazon EBS) is a high-performance, persistent block storage service designed for use with Amazon EC2 instances.

It provides durable, reliable, and scalable storage volumes that can be attached to EC2 instances just like physical hard drives are attached to traditional servers.

Amazon EBS is commonly used to store operating systems, databases, application data, log files, and other critical workloads that require low latency and high availability.

---

# 🎯 Learning Objectives

After completing this module, you will be able to:

* Understand the fundamentals of Amazon EBS
* Learn why Amazon EBS is required
* Differentiate block, file, and object storage
* Create and manage EBS volumes
* Attach and detach EBS volumes from EC2
* Mount EBS volumes on Linux
* Resize EBS volumes
* Create and restore snapshots
* Configure encryption
* Apply AWS best practices
* Prepare for AWS certification and technical interviews

---

# 💡 What is Amazon EBS?

Amazon Elastic Block Store (EBS) is a **block-level storage service** provided by AWS for Amazon EC2 instances.

Think of an EBS volume as a virtual hard disk that provides persistent storage to an EC2 instance.

Unlike instance store volumes, the data stored on an EBS volume remains available even after the EC2 instance is stopped and started again.

---

# 🏢 Real-World Analogy

Imagine you have a laptop.

* **Laptop** → Amazon EC2 Instance
* **SSD / Hard Disk** → Amazon EBS Volume
* **Files and Applications** → Data stored on the EBS Volume

If you restart your laptop, your files remain on the SSD. Similarly, when an EC2 instance is stopped and started, the data stored on the attached EBS volume remains intact.

---

# ❓ Why Do We Need Amazon EBS?

Applications need persistent storage for data that must survive instance restarts or stops.

Examples include:

* Operating System files
* Application binaries
* Databases
* User uploads
* Configuration files
* Log files
* Backup data

Amazon EBS ensures this data remains durable and accessible.

---

# ⭐ Key Features

* Persistent block storage
* Low latency and high performance
* Multiple volume types for different workloads
* Online volume resizing
* Point-in-time snapshots
* Encryption using AWS KMS
* High availability within an Availability Zone
* Integration with Amazon EC2
* Pay only for the storage you provision

---

# 🌍 Common Use Cases

Amazon EBS is commonly used for:

* Boot volumes for EC2 instances
* Relational and NoSQL databases
* Enterprise applications
* Web servers
* Application servers
* Log storage
* Backup and disaster recovery
* Development and testing environments

---

# 📊 Amazon EBS Architecture

```text
                 AWS Region
                      │
          ┌──────────────────────┐
          │ Availability Zone A  │
          └──────────────────────┘
                     │
             ┌──────────────┐
             │ EC2 Instance │
             └──────┬───────┘
                    │
          Attach EBS Volume
                    │
             ┌──────▼───────┐
             │ EBS Volume   │
             │ Persistent   │
             │ Block Storage│
             └──────┬───────┘
                    │
             Create Snapshot
                    │
             ┌──────▼───────┐
             │ Amazon S3*   │
             └──────────────┘

*Snapshots are stored in Amazon S3 and managed by AWS.
```

---

# 📌 Benefits of Amazon EBS

* Persistent storage
* Reliable and durable
* Easy to scale
* High performance
* Secure encryption
* Automated snapshots
* Cost-effective
* Seamless EC2 integration

---

# ⚙️ Typical Workflow

1. Launch an EC2 instance.
2. Create an EBS volume.
3. Attach the volume to the EC2 instance.
4. Partition (if required) and format the volume.
5. Mount the file system.
6. Store application or user data.
7. Create snapshots for backup.
8. Resize the volume when additional storage is needed.

---

# 🎯 Interview Highlights

| Question                                           | Answer                                                                                          |
| -------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| What is Amazon EBS?                                | A persistent block storage service for EC2.                                                     |
| Is EBS persistent?                                 | ✅ Yes                                                                                           |
| Can EBS be resized?                                | ✅ Yes                                                                                           |
| Can EBS be attached to a running EC2 instance?     | ✅ Yes                                                                                           |
| Where are EBS snapshots stored?                    | Amazon S3 (managed by AWS)                                                                      |
| Can an EBS volume be shared between all instances? | Generally no. Multi-Attach is supported only for specific volume types and supported workloads. |
| Is EBS tied to an Availability Zone?               | ✅ Yes                                                                                           |

---

# 📝 Key Takeaways

* Amazon EBS provides persistent block storage for EC2 instances.
* EBS volumes behave like virtual hard disks.
* Data remains available after stopping and starting an EC2 instance.
* Snapshots provide point-in-time backups.
* Volumes can be resized without recreating them.
* Encryption helps protect data at rest.
* Amazon EBS is one of the most widely used storage services in AWS.

---

# 📚 What's Next?

➡️ **02 - What is Amazon EBS?**

In the next chapter, we'll explore:

* EBS architecture in depth
* Block storage fundamentals
* How EBS differs from Instance Store
* EBS life cycle
* Availability Zones
* Volume attachment process
* Common misconceptions

