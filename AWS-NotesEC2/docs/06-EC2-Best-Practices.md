# 06 – Amazon EC2 Best Practices

## 🎯 Objective

Launching an EC2 instance is only the first step. To build secure, reliable, and cost-effective cloud environments, it's important to follow AWS best practices.

This chapter covers the recommended practices for managing Amazon EC2 instances in production environments.

---

# Why Best Practices Matter?

Following AWS best practices helps you:

* Improve security
* Reduce operational costs
* Increase application performance
* Improve reliability and availability
* Simplify management and monitoring
* Prepare for production workloads

---

# 1. Follow the Principle of Least Privilege

Grant only the permissions required to perform a task.

### Best Practices

* Use IAM Roles instead of IAM Users.
* Assign only the required IAM policies.
* Avoid using the AWS root account for daily activities.
* Regularly review IAM permissions.

---

# 2. Use Security Groups Effectively

A Security Group acts as a virtual firewall for your EC2 instance.

### Best Practices

* Allow only required ports.
* Restrict SSH (22) and RDP (3389) access to trusted IP addresses.
* Remove unused inbound rules.
* Avoid opening ports to `0.0.0.0/0` unless necessary.

### Example

| Service | Port |
| ------- | ---- |
| SSH     | 22   |
| HTTP    | 80   |
| HTTPS   | 443  |
| RDP     | 3389 |

---

# 3. Protect Your Key Pair

The private key (`.pem`) is used to access Linux EC2 instances.

### Best Practices

* Store the key securely.
* Never upload it to GitHub.
* Never share it with others.
* Create separate key pairs for different environments.
* Rotate keys when required.

---

# 4. Use IAM Roles Instead of Access Keys

Do not store AWS Access Keys inside your EC2 instances.

### Recommended Approach

* Attach an IAM Role to the instance.
* Grant only the required permissions.
* Allow AWS to provide temporary credentials automatically.

This is more secure and easier to manage.

---

# 5. Keep the Operating System Updated

Regularly install updates and security patches.

### Linux

```bash
sudo yum update -y
```

or

```bash
sudo apt update && sudo apt upgrade -y
```

### Windows

* Install Windows Updates regularly.
* Keep antivirus definitions up to date.

---

# 6. Monitor EC2 with Amazon CloudWatch

CloudWatch provides metrics and monitoring for EC2 instances.

Monitor:

* CPU Utilization
* Memory (with CloudWatch Agent)
* Disk Usage
* Network In/Out
* Status Checks

Create CloudWatch Alarms to receive notifications when thresholds are exceeded.

---

# 7. Enable Detailed Monitoring

AWS offers:

* Basic Monitoring (5-minute intervals)
* Detailed Monitoring (1-minute intervals)

Use Detailed Monitoring for production workloads that require faster visibility.

---

# 8. Create Regular EBS Snapshots

Snapshots help protect data and support disaster recovery.

### Best Practices

* Schedule automatic snapshots.
* Take a snapshot before major updates.
* Test restoring from snapshots periodically.

---

# 9. Use Elastic IPs Only When Needed

Elastic IPs provide a static public IP address.

### Best Practices

* Associate Elastic IPs only when required.
* Release unused Elastic IPs to avoid additional charges.

---

# 10. Stop or Terminate Unused Instances

Running EC2 instances continue to incur compute charges.

### Recommendations

* Stop development and testing instances when not in use.
* Terminate instances that are no longer required.
* Review unused resources regularly.

---

# 11. Tag Your Resources

Tags make it easier to organize and manage AWS resources.

### Common Tags

| Key         | Example      |
| ----------- | ------------ |
| Name        | WebServer-01 |
| Environment | Production   |
| Project     | Learn-AWS    |
| Owner       | Newton       |
| Department  | DevOps       |

---

# 12. Enable Backups

Protect important data by enabling backups.

Options include:

* Amazon EBS Snapshots
* AWS Backup
* Amazon Machine Images (AMIs)

Always verify that backups can be restored successfully.

---

# 13. Use Auto Scaling

Auto Scaling automatically adjusts the number of EC2 instances based on demand.

### Benefits

* Improved availability
* Better performance
* Reduced costs
* Automatic recovery from failures

---

# 14. Use Elastic Load Balancer (ELB)

Distribute incoming traffic across multiple EC2 instances.

### Benefits

* High availability
* Fault tolerance
* Improved scalability
* Better user experience

---

# 15. Enable Logging and Auditing

Use AWS services to track activity and troubleshoot issues.

Recommended services:

* AWS CloudTrail
* Amazon CloudWatch Logs
* AWS Config

These services help maintain security and compliance.

---

# Cost Optimization Tips

* Choose the correct instance type.
* Stop unused instances.
* Delete unused EBS volumes.
* Release unused Elastic IPs.
* Use Auto Scaling to match demand.
* Consider Reserved Instances or Savings Plans for long-term workloads.

---

# Security Checklist

* Use IAM Roles
* Restrict Security Groups
* Protect private keys
* Keep systems updated
* Enable CloudTrail
* Enable CloudWatch monitoring
* Encrypt EBS volumes
* Use Multi-Factor Authentication (MFA) for AWS accounts

---

# Interview Questions

### Q1. Why should you use IAM Roles instead of Access Keys on EC2?

**Answer:** IAM Roles provide temporary credentials, eliminating the need to store long-term access keys on the instance.

---

### Q2. Which AWS service is used to monitor EC2 instances?

**Answer:** Amazon CloudWatch

---

### Q3. Which AWS service records API activity?

**Answer:** AWS CloudTrail

---

### Q4. Why should you create EBS snapshots?

**Answer:** To back up data and enable recovery in case of failures or accidental deletion.

---

### Q5. Why should SSH access not be open to `0.0.0.0/0`?

**Answer:** It exposes the instance to the internet, increasing the risk of unauthorized access. Restrict SSH access to trusted IP addresses whenever possible.

---

# Key Takeaways

* Secure EC2 instances using IAM Roles and Security Groups.
* Monitor performance with CloudWatch.
* Track API activity with CloudTrail.
* Protect data using EBS Snapshots and backups.
* Tag resources for better organization.
* Stop or terminate unused instances to reduce costs.
* Use Auto Scaling and Load Balancers for high availability.

---

## Summary

In this chapter, you learned:

* EC2 security best practices
* Monitoring and logging
* Backup and recovery strategies
* Cost optimization techniques
* Resource tagging
* High availability recommendations
* Common interview questions

➡️ **Next Chapter:** `07-EC2-Interview-Questions.md`
