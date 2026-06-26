# AWS AMI (Amazon Machine Image)

## Overview

Amazon Machine Image (AMI) is a pre-configured template used to launch Amazon EC2 instances.

Think of an AMI as a **blueprint** or **golden copy** of a server that contains:

* Operating System (Linux/Windows)
* Installed Software
* Application Configurations
* Security Settings
* User Accounts
* File System Data

When you launch an EC2 instance, AWS uses an AMI to create the server.

---

## AMI Architecture

![AMI Architecture](images/architecture.png)

```text
EC2 Instance
     │
     ▼
Create AMI
     │
     ▼
Custom AMI
     │
     ▼
Launch Multiple EC2 Instances
```

---

## What is an AMI?

An Amazon Machine Image (AMI) provides the information required to launch an EC2 instance.

It serves as a reusable template that allows organizations to quickly deploy identical servers with consistent configurations.

---

## Components of an AMI

### 1. Root Volume Snapshot

Contains:

* Operating System
* Installed Applications
* Configuration Files

### 2. Launch Permissions

Controls who can access and use the AMI.

### 3. Block Device Mapping

Defines storage volumes attached to launched instances.

---

## Types of AMIs

### Public AMI

Available to all AWS users.

Examples:

* Amazon Linux
* Ubuntu
* Windows Server

### Private AMI

Accessible only within your AWS account.

### Shared AMI

Shared with specific AWS accounts.

### Marketplace AMI

Available through AWS Marketplace with licensed software.

---

## AMI vs Snapshot

| Feature         | AMI                  | Snapshot           |
| --------------- | -------------------- | ------------------ |
| Purpose         | Launch EC2 Instances | Backup EBS Volumes |
| Contains OS     | Yes                  | No                 |
| Launch Instance | Yes                  | No                 |
| Uses Snapshot   | Yes                  | Yes                |

### Relationship

```text
EBS Volume
     │
     ▼
Snapshot
     │
[2;2R[3;1R     ▼
[>77;30801;0c]10;rgb:bfbf/bfbf/bfbf]11;rgb:0000/0000/0000AMI
     │
     ▼
EC2 Instance
```

---

## Common Use Cases

### Server Cloning

Create multiple identical servers quickly.

### Auto Scaling

Launch pre-configured instances automatically.

### Disaster Recovery

Recover infrastructure rapidly.

### Golden AMI

Create standardized company-approved images.

---

## Advantages of AMI

* Faster Deployments
* Consistent Environments
* Easy Backup and Recovery
* Supports Auto Scaling
* Reduces Manual Configuration

---

# AWS SAA-C03 Exam Questions

## Question 1

A company wants to launch multiple EC2 instances with the same operating system, software, and configuration.

Which AWS service should be used?

**A.** EBS Snapshot

**B.** Amazon AMI

**C.** AWS Backup

**D.** Amazon S3

### Answer

✅ **B. Amazon AMI**

### Explanation

AMI acts as a template for launching identical EC2 instances.

---

## Question 2

What is automatically created when an AMI is generated from an EBS-backed EC2 instance?

**A.** S3 Bucket

**B.** EFS File System

**C.** EBS Snapshot

**D.** Route 53 Record

### Answer

✅ **C. EBS Snapshot**

### Explanation

AWS creates EBS snapshots of attached volumes and uses them to build the AMI.

---

## Question 3

Which AMI type can only be used within your AWS account?

**A.** Public AMI

**B.** Marketplace AMI

**C.** Shared AMI

**D.** Private AMI

### Answer

✅ **D. Private AMI**

### Explanation

Private AMIs are accessible only to the owner account unless explicitly shared.

---

## Question 4

A company wants to maintain a standardized image with security patches, monitoring tools, and company-approved configurations.

Which solution should they use?

**A.** EBS Snapshot

**B.** AWS Backup

**C.** Golden AMI

**D.** Elastic IP

### Answer

✅ **C. Golden AMI**

### Explanation

Golden AMIs contain pre-approved configurations and software for consistent deployments.

---

## Question 5

Which AWS service uses AMIs to launch EC2 instances automatically based on demand?

**A.** AWS Lambda

**B.** Auto Scaling Group

**C.** Route 53

**D.** CloudFront

### Answer

✅ **B. Auto Scaling Group**

### Explanation

Auto Scaling Groups use launch templates that reference AMIs to create new EC2 instances automatically.

---

## Key Takeaways

✅ AMI is a blueprint for EC2 instances.

✅ AMIs contain operating systems, applications, and configurations.

✅ AWS creates EBS Snapshots when generating an AMI.

✅ Golden AMIs help standardize infrastructure.

✅ AMIs are commonly used in Auto Scaling and Disaster Recovery solutions.

✅ AMI-related questions are frequently asked in the AWS Certified Solutions Architect Associate (SAA-C03) exam.

---

<h2 align="center">AWS AMI Architecture</h2>

<p align="center">
  <img src="images/architecture.png"
       alt="AWS AMI Architecture"
       width="900">
</p>

<p align="center">
  <em>Figure 1: AMI Creation and EC2 Instance Deployment Workflow</em>
</p>

