# 05 – Linux vs Windows EC2 Instances

## 🎯 Objective

Amazon EC2 supports multiple operating systems, with **Linux** and **Windows** being the most commonly used. Choosing the right operating system depends on your application, licensing, cost, and management requirements.

This chapter explains the differences between Linux and Windows EC2 instances, helping you decide which option is best for your workload.

---

# What is a Linux EC2 Instance?

A Linux EC2 instance is a virtual machine running a Linux operating system in AWS.

Common Linux distributions include:

* Amazon Linux 2023
* Ubuntu
* Red Hat Enterprise Linux (RHEL)
* CentOS
* Debian
* SUSE Linux Enterprise Server

### Best suited for:

* Web servers
* Application servers
* Docker and Kubernetes
* DevOps automation
* CI/CD pipelines
* Databases
* Microservices

---

# What is a Windows EC2 Instance?

A Windows EC2 instance runs the Microsoft Windows Server operating system.

Common versions include:

* Windows Server 2019
* Windows Server 2022

### Best suited for:

* .NET applications
* Microsoft SQL Server
* Active Directory
* IIS Web Server
* Windows-based enterprise applications
* Remote Desktop environments

---

# Linux vs Windows EC2

| Feature             | Linux EC2                           | Windows EC2                       |
| ------------------- | ----------------------------------- | --------------------------------- |
| Operating System    | Linux                               | Windows Server                    |
| Login Method        | SSH                                 | RDP                               |
| Default Port        | 22                                  | 3389                              |
| Default Username    | ec2-user / ubuntu                   | Administrator                     |
| Authentication      | Key Pair (.pem)                     | Administrator Password + RDP      |
| Cost                | Lower                               | Higher (includes Windows license) |
| Performance         | Lightweight                         | Higher resource usage             |
| Software Management | Package Managers (yum, apt, dnf)    | Windows Installer, PowerShell     |
| Automation          | Shell Scripts, Bash                 | PowerShell                        |
| GUI                 | Usually No                          | Yes                               |
| Boot Time           | Faster                              | Slower                            |
| Common Use Cases    | Linux workloads, containers, DevOps | Microsoft applications            |

---

# Connection Methods

## Linux

Connect using SSH.

Example:

```bash
ssh -i my-key.pem ec2-user@<Public-IP>
```

---

## Windows

Connect using Remote Desktop Protocol (RDP).

Steps:

1. Download the RDP file.
2. Decrypt the Administrator password using the `.pem` key.
3. Open the RDP file.
4. Log in using the Administrator account.

---

# Storage Support

Both Linux and Windows EC2 instances support:

* Amazon EBS
* Instance Store
* Amazon EFS (when configured)
* Amazon FSx (supported based on workload)

---

# Security Considerations

### Linux

* Use SSH keys instead of passwords.
* Restrict SSH access to trusted IP addresses.
* Disable root login where possible.
* Keep packages updated.

### Windows

* Restrict RDP access to trusted IP addresses.
* Change the Administrator password after first login.
* Install Windows Updates regularly.
* Enable Windows Firewall.

---

# Cost Comparison

| Linux                              | Windows                                |
| ---------------------------------- | -------------------------------------- |
| No operating system license cost   | Windows license included               |
| Lower hourly pricing               | Higher hourly pricing                  |
| Ideal for cost-sensitive workloads | Suitable for Microsoft-based workloads |

---

# Performance Comparison

### Linux

* Lower memory usage
* Faster startup time
* Efficient resource utilization
* Preferred for cloud-native applications

### Windows

* Higher memory usage
* Longer startup time
* Better compatibility with Microsoft software
* Ideal for enterprise Windows applications

---

# Common Use Cases

## Choose Linux EC2 for:

* Apache or Nginx web servers
* Docker containers
* Kubernetes clusters
* Jenkins
* GitLab
* Terraform
* Ansible
* Node.js, Python, Java, Go, PHP applications
* MySQL and PostgreSQL databases

---

## Choose Windows EC2 for:

* ASP.NET applications
* Microsoft SQL Server
* IIS Web Server
* Active Directory Domain Services
* SharePoint
* Microsoft enterprise software
* Remote Desktop environments

---

# Advantages of Linux EC2

* Lower cost
* Fast boot time
* Excellent performance
* Large open-source ecosystem
* Strong support for DevOps tools
* Ideal for automation and scripting

---

# Advantages of Windows EC2

* Familiar graphical interface
* Excellent integration with Microsoft products
* Native support for .NET applications
* Easy administration using Remote Desktop
* Suitable for enterprise Windows workloads

---

# Best Practices

* Choose Linux for modern cloud-native and DevOps workloads.
* Choose Windows only when Microsoft technologies are required.
* Restrict SSH (22) and RDP (3389) access using Security Groups.
* Apply operating system updates regularly.
* Use IAM roles instead of storing AWS credentials on instances.
* Monitor instances using Amazon CloudWatch.

---

# Interview Questions

### Q1. Which protocol is used to connect to a Linux EC2 instance?

**Answer:** SSH (Port 22)

---

### Q2. Which protocol is used to connect to a Windows EC2 instance?

**Answer:** RDP (Port 3389)

---

### Q3. Why are Windows EC2 instances more expensive?

**Answer:** The hourly price includes the Microsoft Windows Server licensing cost.

---

### Q4. Which operating system is preferred for DevOps tools like Docker and Kubernetes?

**Answer:** Linux

---

### Q5. What is the default username for Amazon Linux?

**Answer:** `ec2-user`

---

### Q6. What is the default username for Windows EC2?

**Answer:** `Administrator`

---

# Key Takeaways

* Linux EC2 is lightweight, cost-effective, and ideal for cloud-native applications.
* Windows EC2 is designed for Microsoft technologies and enterprise workloads.
* Linux uses SSH for remote access, while Windows uses RDP.
* Linux instances are generally less expensive because they do not include Windows licensing costs.
* Choose the operating system based on your application's technical and business requirements.

---

## Summary

In this chapter, you learned:

* The differences between Linux and Windows EC2 instances
* Connection methods and default usernames
* Cost and performance comparison
* Common use cases
* Security best practices
* Interview questions

➡️ **Next Chapter:** `06-EC2-Best-Practices.md`
