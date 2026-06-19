# 07 – Amazon EC2 Interview Questions

## 🎯 Objective

This chapter covers the most commonly asked Amazon EC2 interview questions. It is designed to help beginners and experienced professionals prepare for AWS certifications and technical interviews.

---

# Basic EC2 Questions

### 1. What is Amazon EC2?

**Answer:**

Amazon EC2 (Elastic Compute Cloud) is a web service that provides secure, resizable virtual servers in the AWS Cloud. It allows users to launch and manage virtual machines on demand.

---

### 2. What does EC2 stand for?

**Answer:**

Elastic Compute Cloud.

---

### 3. What is an EC2 Instance?

**Answer:**

An EC2 instance is a virtual server running in AWS. It provides compute capacity for hosting applications, websites, databases, and other workloads.

---

### 4. What are the main components required to launch an EC2 instance?

**Answer:**

* Amazon Machine Image (AMI)
* Instance Type
* Key Pair
* Security Group
* Storage (EBS or Instance Store)
* Network (VPC/Subnet)
* IAM Role (optional but recommended)

---

### 5. What is an AMI?

**Answer:**

An Amazon Machine Image (AMI) is a template used to launch an EC2 instance. It includes the operating system, software, and configuration.

---

# Instance Types

### 6. What is an EC2 Instance Type?

**Answer:**

It defines the CPU, memory, storage, and networking capacity of an EC2 instance.

---

### 7. Name some EC2 instance families.

**Answer:**

* General Purpose (T, M)
* Compute Optimized (C)
* Memory Optimized (R, X)
* Storage Optimized (I, D)
* Accelerated Computing (P, G, Inf)

---

### 8. Which instance family is suitable for web applications?

**Answer:**

General Purpose (T3, T4g, M5, M6i).

---

### 9. Which instance family is suitable for machine learning?

**Answer:**

Accelerated Computing (P and G series).

---

# Security

### 10. What is a Security Group?

**Answer:**

A Security Group is a virtual firewall that controls inbound and outbound traffic to an EC2 instance.

---

### 11. What is the default SSH port?

**Answer:**

Port **22**.

---

### 12. What is the default RDP port?

**Answer:**

Port **3389**.

---

### 13. Why should you avoid opening SSH to `0.0.0.0/0`?

**Answer:**

It allows anyone on the internet to attempt SSH access, increasing security risks. Restrict access to trusted IP addresses.

---

### 14. What is a Key Pair?

**Answer:**

A Key Pair consists of a public key stored in AWS and a private key (`.pem`) used to securely connect to Linux EC2 instances.

---

# Storage

### 15. What is Amazon EBS?

**Answer:**

Amazon Elastic Block Store (EBS) provides persistent block storage for EC2 instances.

---

### 16. What happens to EBS when an instance is stopped?

**Answer:**

The EBS volume remains attached, and the data is preserved.

---

### 17. What is an EBS Snapshot?

**Answer:**

An EBS Snapshot is a backup of an EBS volume stored in Amazon S3.

---

# Lifecycle

### 18. What are the EC2 instance states?

**Answer:**

* Pending
* Running
* Stopping
* Stopped
* Starting
* Rebooting
* Shutting-down
* Terminated

---

### 19. What is the difference between Stop and Terminate?

**Stop:**

* Instance can be started again.
* EBS volume is preserved.
* No compute charges while stopped.

**Terminate:**

* Instance is permanently deleted.
* Cannot be restarted.

---

### 20. Does rebooting an EC2 instance change the Instance ID?

**Answer:**

No. The Instance ID remains the same.

---

# Networking

### 21. What is a Public IP?

**Answer:**

A Public IP allows an EC2 instance to communicate with the internet.

---

### 22. What is an Elastic IP?

**Answer:**

An Elastic IP is a static public IPv4 address that remains associated with your AWS account until released.

---

### 23. What is a VPC?

**Answer:**

A Virtual Private Cloud (VPC) is an isolated virtual network where AWS resources are launched.

---

### 24. Can you launch an EC2 instance without a VPC?

**Answer:**

No. Every EC2 instance must be launched inside a VPC.

---

# Monitoring

### 25. Which AWS service monitors EC2?

**Answer:**

Amazon CloudWatch.

---

### 26. Which AWS service records API activity?

**Answer:**

AWS CloudTrail.

---

### 27. What is Detailed Monitoring?

**Answer:**

Detailed Monitoring provides EC2 metrics at 1-minute intervals instead of the default 5-minute intervals.

---

# IAM

### 28. Why should you use IAM Roles with EC2?

**Answer:**

IAM Roles provide temporary credentials, eliminating the need to store long-term AWS access keys on the instance.

---

### 29. Can multiple EC2 instances share the same IAM Role?

**Answer:**

Yes.

---

# Linux vs Windows

### 30. Which protocol is used to connect to Linux EC2?

**Answer:**

SSH.

---

### 31. Which protocol is used to connect to Windows EC2?

**Answer:**

RDP.

---

### 32. What is the default username for Amazon Linux?

**Answer:**

`ec2-user`

---

### 33. What is the default username for Ubuntu?

**Answer:**

`ubuntu`

---

### 34. What is the default username for Windows EC2?

**Answer:**

`Administrator`

---

# Cost Optimization

### 35. How can you reduce EC2 costs?

**Answer:**

* Stop unused instances.
* Terminate unused resources.
* Choose the correct instance size.
* Use Auto Scaling.
* Use Reserved Instances or Savings Plans for predictable workloads.

---

### 36. Do stopped instances incur compute charges?

**Answer:**

No. However, attached EBS volumes and other storage resources continue to incur charges.

---

# Best Practices

### 37. Why should you tag EC2 instances?

**Answer:**

Tags help organize, identify, automate, and allocate costs for AWS resources.

---

### 38. Why are EBS snapshots important?

**Answer:**

They provide backups and enable disaster recovery.

---

### 39. Which AWS service distributes traffic across multiple EC2 instances?

**Answer:**

Elastic Load Balancer (ELB).

---

### 40. Which AWS service automatically scales EC2 instances?

**Answer:**

Auto Scaling.

---

# Scenario-Based Questions

### 41. Your website becomes slow due to high traffic. Which AWS service helps?

**Answer:**

Auto Scaling with an Elastic Load Balancer.

---

### 42. Your EC2 instance is unreachable via SSH. What should you check?

**Answer:**

* Security Group allows port 22.
* Correct key pair is used.
* Correct username is used.
* Instance is running.
* Public IP address is correct.
* Network ACLs and route tables are configured properly.

---

### 43. You accidentally terminated an EC2 instance. Can you recover it?

**Answer:**

No. A terminated instance cannot be recovered. However, if you have an AMI or EBS snapshot, you can launch a new instance from it.

---

### 44. When should you use an Elastic IP?

**Answer:**

When you need a persistent public IP address, such as for production servers or DNS records.

---

### 45. Why is an IAM Role preferred over storing Access Keys?

**Answer:**

IAM Roles provide temporary credentials that are automatically rotated by AWS, improving security.

---

# Quick Revision

| Topic                | Key Point         |
| -------------------- | ----------------- |
| SSH Port             | 22                |
| RDP Port             | 3389              |
| Linux Username       | ec2-user / ubuntu |
| Windows Username     | Administrator     |
| Monitoring           | CloudWatch        |
| API Logging          | CloudTrail        |
| Persistent Storage   | EBS               |
| Static Public IP     | Elastic IP        |
| Traffic Distribution | ELB               |
| Automatic Scaling    | Auto Scaling      |
| Backup               | EBS Snapshot      |
| Secure AWS Access    | IAM Role          |

---

# Final Tips for Interviews

* Understand the complete EC2 launch process.
* Practice connecting to both Linux and Windows instances.
* Know the differences between Stop, Reboot, and Terminate.
* Learn Security Groups, IAM Roles, EBS, and VPC fundamentals.
* Be able to explain cost optimization techniques.
* Gain hands-on experience with the AWS Management Console and AWS CLI.

---

# Congratulations!

🎉 You have completed the **Amazon EC2 Instance Guide**.

You now understand:

* EC2 fundamentals
* Launching instances
* Connecting to Linux and Windows instances
* Instance lifecycle
* Security and best practices
* Cost optimization
* Common interview questions

This knowledge provides a strong foundation for learning advanced AWS services such as **EBS, VPC, Load Balancers, Auto Scaling, RDS, ECS, EKS, and Lambda**.

---

## Next Learning Path

Continue your AWS journey with:

1. Amazon EBS (Elastic Block Store)
2. Amazon VPC
3. Elastic Load Balancer (ELB)
4. Auto Scaling Groups (ASG)
5. Amazon RDS
6. Amazon S3
7. IAM Advanced Concepts
8. AWS CLI
9. CloudFormation
10. Terraform on AWS

Happy Learning! 🚀
