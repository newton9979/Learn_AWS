# Amazon EC2 (Elastic Compute Cloud) - Introduction

## 📖 Table of Contents

* What is Amazon EC2?
* Why Do We Need EC2?
* Features of Amazon EC2
* Benefits of EC2
* Common Use Cases
* EC2 Basic Architecture
* Key Components
* EC2 Pricing Models
* Advantages & Limitations
* Key Takeaways
* Interview Questions

---

# What is Amazon EC2?

**Amazon Elastic Compute Cloud (Amazon EC2)** is a web service provided by AWS that allows you to launch and manage virtual servers in the cloud.

Instead of purchasing and maintaining physical servers, you can create virtual machines (called **EC2 instances**) within minutes and pay only for the resources you use.

Think of EC2 as renting a computer in the AWS cloud.

---

# Why Do We Need EC2?

Traditional infrastructure has several challenges:

* High hardware costs
* Long server provisioning time
* Limited scalability
* High maintenance effort
* Downtime during hardware failures

Amazon EC2 solves these problems by providing:

* On-demand virtual servers
* Elastic scaling
* High availability
* Global deployment
* Pay-as-you-go pricing

---

# Features of Amazon EC2

* Launch virtual servers in minutes
* Multiple operating systems (Linux & Windows)
* Wide range of instance types
* Secure networking using Security Groups
* Flexible storage with Amazon EBS
* Auto Scaling support
* Load Balancer integration
* IAM integration for access control
* Monitoring using Amazon CloudWatch

---

# Benefits of EC2

| Benefit           | Description                                     |
| ----------------- | ----------------------------------------------- |
| Scalability       | Scale resources up or down as needed            |
| Flexibility       | Choose CPU, RAM, storage, and operating system  |
| Cost Effective    | Pay only for what you use                       |
| High Availability | Deploy across multiple Availability Zones       |
| Security          | IAM roles, Security Groups, and VPC integration |
| Global Reach      | Deploy workloads in AWS Regions worldwide       |

---

# Common Use Cases

Amazon EC2 is widely used for:

* Hosting websites
* Running web applications
* Development and testing
* Database servers
* CI/CD build servers
* Docker & Kubernetes nodes
* Machine Learning workloads
* Big Data processing
* Game servers
* Enterprise applications

---

# EC2 Basic Architecture

```text
                    AWS Cloud
                        │
        ┌─────────────────────────────┐
        │         Amazon EC2          │
        │                             │
        │  ┌───────────────────────┐  │
        │  │     EC2 Instance      │  │
        │  │                       │  │
        │  │  Linux / Windows OS   │  │
        │  │  CPU • RAM • Storage  │  │
        │  └───────────────────────┘  │
        └─────────────────────────────┘
                        │
        ┌───────────────┼───────────────┐
        │               │               │
    Security Group     EBS          Key Pair
```

---

# Key Components of EC2

## 1. AMI (Amazon Machine Image)

An AMI is a preconfigured template that contains:

* Operating System
* Installed software
* Configuration settings

Examples:

* Amazon Linux
* Ubuntu
* Red Hat Enterprise Linux
* Windows Server

---

## 2. Instance Type

Defines the hardware configuration of an EC2 instance.

Examples:

* t2.micro
* t3.micro
* m7i.large
* c7g.large
* r7i.large

Each type offers different combinations of CPU, memory, storage, and networking performance.

---

## 3. Security Group

A Security Group acts as a virtual firewall.

It controls:

* Inbound traffic
* Outbound traffic

Example:

* SSH (Port 22)
* HTTP (Port 80)
* HTTPS (Port 443)

---

## 4. Key Pair

A Key Pair is used to securely connect to Linux EC2 instances using SSH.

It consists of:

* Public Key (stored by AWS)
* Private Key (downloaded and kept securely by you)

---

## 5. Elastic Block Store (EBS)

Amazon EBS provides persistent storage for EC2 instances.

Features:

* Durable
* High performance
* Resizable
* Snapshot support

---

# EC2 Pricing Models

AWS offers multiple pricing options:

| Pricing Model      | Best For                                 |
| ------------------ | ---------------------------------------- |
| On-Demand          | Short-term or unpredictable workloads    |
| Reserved Instances | Long-term steady workloads               |
| Savings Plans      | Flexible long-term cost savings          |
| Spot Instances     | Fault-tolerant workloads at a lower cost |
| Dedicated Hosts    | Compliance and licensing requirements    |

---

# Advantages of Amazon EC2

* Fast provisioning
* Pay-as-you-go pricing
* Highly scalable
* Secure
* Reliable
* Global infrastructure
* Wide operating system support
* Easy integration with other AWS services

---

# Limitations

* Requires proper security configuration
* Costs can increase if resources are left running
* Requires basic Linux or Windows administration knowledge

---

# Key Takeaways

* Amazon EC2 provides virtual servers in the cloud.
* You can launch instances within minutes.
* EC2 supports Linux and Windows operating systems.
* Security Groups act as virtual firewalls.
* EBS provides persistent block storage.
* Multiple pricing models help optimize costs.

---

# Interview Questions

### 1. What is Amazon EC2?

Amazon EC2 is a cloud service that provides resizable virtual servers on demand.

---

### 2. What is an EC2 Instance?

An EC2 Instance is a virtual machine running in the AWS Cloud.

---

### 3. What is an AMI?

An Amazon Machine Image (AMI) is a template used to launch EC2 instances.

---

### 4. What is a Security Group?

A Security Group is a virtual firewall that controls inbound and outbound traffic for an EC2 instance.

---

### 5. What is the difference between EBS and Instance Store?

* **EBS:** Persistent storage that remains after stopping the instance.
* **Instance Store:** Temporary storage that is lost when the instance stops or terminates.

---

# Next Topic

➡️ **02-Launch-EC2-Instance.md**

In the next chapter, you'll learn how to launch your first EC2 instance using the AWS Management Console and understand every configuration option step by step.
