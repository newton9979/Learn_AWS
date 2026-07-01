# Amazon S3 Security and Permissions — Complete Guide

## Introduction

Amazon S3 is one of the most widely used storage services in AWS, storing everything from application assets and backups to sensitive customer information. Because of this, securing your S3 buckets and objects is critical.

Misconfigured S3 permissions have been responsible for many public data breaches. AWS provides multiple security mechanisms to ensure that only authorized users and applications can access your data.

In this guide, you'll learn the core security concepts, understand how permissions work, and explore AWS best practices for securing Amazon S3 — from IAM and bucket policies through ACLs, encryption, pre-signed URLs, CORS, and troubleshooting.

---

## Why S3 Security Matters

Data stored in Amazon S3 may contain:

- Customer Information
- Financial Records
- Application Logs
- Database Backups
- Source Code
- Medical Records
- Business Documents

If an S3 bucket is accidentally made public, anyone on the internet may be able to access its contents.

A well-designed security strategy helps protect data from:

- Unauthorized Access
- Data Leaks
- Accidental Deletion
- Malicious Attacks
- Compliance Violations

---

## AWS Shared Responsibility Model

AWS follows the **Shared Responsibility Model**, where security responsibilities are divided between AWS and the customer.

```
             AWS Cloud

     +-------------------------+
     |     AWS Responsibility  |
     +-------------------------+
     | Physical Data Centers   |
     | Networking              |
     | Storage Hardware        |
     | Global Infrastructure   |
     | Hypervisor              |
     +-------------------------+

                │

                ▼

     +-------------------------+
     | Customer Responsibility |
     +-------------------------+
     | IAM Users & Roles       |
     | Bucket Policies         |
     | Object Permissions      |
     | Encryption              |
     | Access Management       |
     | Data Classification     |
     +-------------------------+
```

### AWS is Responsible For

- Physical security of data centers
- Hardware maintenance
- Network infrastructure
- Storage infrastructure
- Service availability

### Customers are Responsible For

- Configuring IAM permissions
- Managing bucket policies
- Protecting AWS credentials
- Enabling encryption
- Controlling object access
- Securing applications

---

## Authentication vs Authorization

These two concepts are often confused but serve different purposes.

### Authentication

Authentication answers the question: **"Who are you?"**

AWS verifies your identity before allowing access.

Examples:

- IAM User
- IAM Role
- AWS CLI credentials
- Temporary Security Credentials

### Authorization

Authorization answers the question: **"What are you allowed to do?"**

After authentication, AWS checks whether you have permission to perform the requested action.

Example:

```
User: DevOps Engineer
↓
Authenticated Successfully
↓
Permission Check
↓
Can Upload Objects?
YES ✅

Can Delete Bucket?
NO ❌
```

Authentication identifies the user, while authorization determines what actions they can perform.

---

## Layers of Amazon S3 Security

Amazon S3 uses multiple security layers to protect data.

```
                  Amazon S3 Security

                        │
        ┌───────────────┼────────────────┐
        │               │                │
        ▼               ▼                ▼
      IAM          Bucket Policy        ACL
        │
        ▼
 Block Public Access
        │
        ▼
 Object Ownership
        │
        ▼
 Encryption
        │
        ▼
 Secure Data Access
```

These layers work together to ensure only authorized users and applications can access your data.

### Identity-Based Access

Identity-based access is controlled using **AWS Identity and Access Management (IAM)**.

Permissions are attached to:

- IAM Users
- IAM Groups
- IAM Roles

Example:

```
DevOps Team
↓
IAM Group
↓
AmazonS3FullAccess
```

All members of the group inherit the assigned permissions.

### Resource-Based Access

Amazon S3 also supports **Resource-Based Policies**, known as **Bucket Policies**.

Instead of granting permissions to users, permissions are attached directly to the bucket.

Example:
[O
```
S3 Bucket
↓
Bucket Policy
↓
Allow Read Access
↓
Application Server (EC2)
```

Bucket Policies are commonly used to allow access for:

- EC2 Instances
- Lambda Functions
- Cross-Account Access
- Static Website Hosting

---

## Principle of Least Privilege

One of the most important AWS security principles is the **Principle of Least Privilege**.

Users and applications should receive **only the permissions required** to perform their tasks.

**Example**

Instead of granting:

```
AmazonS3FullAccess
```

Grant only the required permissions:

```
s3:GetObject
s3:PutObject
s3:ListBucket
```

This reduces the risk of accidental or unauthorized actions.

---

## Common Security Risks

Improper configuration can expose sensitive data. Common risks include:

**Public Buckets** — Sensitive files become accessible to everyone on the internet.

**Overly Broad IAM Permissions** — Granting excessive permissions increases security risks.

**Disabled Encryption** — Sensitive data remains unprotected while stored.

**Sharing Root Account Credentials** — The AWS root account should never be used for everyday operations. Always create IAM users or roles with appropriate permissions.

**Hardcoding AWS Access Keys** — Never store AWS credentials directly in source code, GitHub repositories, or configuration files. Instead, use IAM Roles, AWS Secrets Manager, or environment variables.

---

## Real-World Scenario: Customer Invoices

Imagine a company stores customer invoices in Amazon S3.

```
Customers
↓
Web Application
↓
Amazon S3
↓
customer-invoices/
```

Security Configuration:

- Block Public Access Enabled
- IAM Role attached to EC2
- Bucket Policy allowing only the application role
- Default Encryption enabled
- Versioning enabled
- CloudTrail logging enabled

With these controls, customers cannot directly access the bucket, and only the application can read or write invoice files.

---

## IAM Policies and Bucket Policies

Amazon S3 uses multiple authorization mechanisms to control access to buckets and objects.

The two most commonly used permission models are:

- **IAM Policies (Identity-Based Policies)**
- **Bucket Policies (Resource-Based Policies)**

Although both grant permissions, they work differently and are designed for different use cases.

### AWS Identity and Access Management (IAM)

AWS Identity and Access Management (IAM) is the service used to securely manage access to AWS resources.

Using IAM, you can create:

- Users
- Groups
- Roles
- Policies

IAM ensures that only authenticated users and applications can access AWS resources.

```
                AWS Account
                     │
      ┌──────────────┼──────────────┐
      │              │              │
      ▼              ▼              ▼
  IAM Users     IAM Groups     IAM Roles
                     │
                     ▼
               IAM Policies
                     │
                     ▼
                Amazon S3
```

### IAM Users

An IAM User represents an individual person or application that needs access to AWS resources.

Each IAM User has:

- Username
- Password (Console Access)
- Access Keys (CLI/API)
- Assigned Permissions

**Example**

```
IAM Users

├── Alice
├── Bob
├── DevOps
└── Developer
```

Each user receives only the permissions required for their job.

### IAM Groups

An IAM Group is a collection of IAM Users.

Instead of assigning permissions individually, permissions are attached to the group.

Example:

```
Developers Group

│
├── Alice
├── Bob
└── Charlie

↓

AmazonS3ReadOnlyAccess
```

Benefits:

- Easier administration
- Consistent permissions
- Simplified user management

### IAM Roles

An IAM Role provides temporary permissions to AWS services or users.

Unlike IAM Users, Roles do not have permanent credentials.

Common use cases:

- Amazon EC2
- AWS Lambda
- Amazon ECS
- Amazon EKS
- Cross-Account Access

**Example**

```
EC2 Instance
↓
IAM Role
↓
Amazon S3
↓
Upload Application Logs
```

AWS automatically provides temporary credentials to the EC2 instance.

### IAM Policies

IAM Policies are JSON documents that define permissions.

They answer three questions: Who? What Action? Which Resource?

Example structure:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-company-data/*"
    }
  ]
}
```

This policy allows users to read objects from the specified S3 bucket.

### Common Amazon S3 IAM Actions

| Action | Description |
|---------|-------------|
| s3:ListBucket | List bucket contents |
| s3:GetObject | Download objects |
| s3:PutObject | Upload objects |
| s3:DeleteObject | Delete objects |
| s3:GetBucketLocation | View bucket region |
| s3:CreateBucket | Create a new bucket |
| s3:DeleteBucket | Delete a bucket |

These actions can be combined to create custom permission sets.

### AWS Managed Policies

AWS provides pre-built IAM policies for common use cases.

| Policy | Purpose |
|---------|----------|
| AmazonS3ReadOnlyAccess | Read-only access to S3 |
| AmazonS3FullAccess | Full access to S3 |
| AdministratorAccess | Full access to all AWS services |

Managed policies are useful for learning but should be used carefully in production environments.

### Customer Managed Policies

Organizations often create custom policies that grant only the permissions required.

Example:

```
Developer
↓
Can Upload Files
Can Download Files
Cannot Delete Buckets
```

This follows the **Principle of Least Privilege**.

### Bucket Policies

Bucket Policies are attached directly to an S3 bucket.

Instead of granting permissions to users, they define who can access the bucket and what actions are allowed.

```
Amazon S3 Bucket
↓
Bucket Policy
↓
Allow Access
↓
IAM User
IAM Role
AWS Account
```

Bucket Policies are commonly used for:

- Cross-account access
- Static website hosting
- Allowing EC2 access
- Restricting access by IP address
- Enforcing HTTPS-only access

**Example Bucket Policy**

The following policy allows everyone to read objects from a public bucket.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Principal":"*",
      "Action":"s3:GetObject",
      "Resource":"arn:aws:s3:::my-public-website/*"
    }
  ]
}
```

⚠️ **Warning:** Never use a public policy for buckets containing sensitive or private data.

### IAM Policy vs Bucket Policy

| Feature | IAM Policy | Bucket Policy |
|----------|------------|---------------|
| Attached To | IAM User, Group, Role | S3 Bucket |
| Policy Type | Identity-Based | Resource-Based |
| Controls | What a user can do | Who can access the bucket |
| Cross-Account Access | Limited | Excellent |
| Common Use | Internal users | External access and bucket-specific permissions |

### Permission Evaluation

When a user requests access to an S3 bucket, AWS evaluates permissions in the following order:

```
User Request
↓
Authentication
↓
IAM Policy Check
↓
Bucket Policy Check
↓
Explicit Deny?
│
├── Yes → Access Denied
└── No
↓
Allow?
│
├── Yes → Access Granted
└── No → Access Denied
```

**Important Rule:** An Explicit Deny always overrides an Allow.

### Real-World Scenario: EC2-Backed Web Application

Imagine a company hosts a web application on Amazon EC2.

```
Users
↓
Web Application
↓
EC2 Instance
↓
IAM Role
↓
Amazon S3 Bucket
↓
Application Images
```

Configuration:

- EC2 uses an IAM Role.
- IAM Role has permission to upload images.
- Bucket Policy allows only that IAM Role.
- Public access is blocked.

This setup is secure because users never interact directly with the S3 bucket.

### IAM and Bucket Policy Best Practices

✅ Use IAM Roles instead of Access Keys.

✅ Follow the Principle of Least Privilege.

✅ Prefer Customer Managed Policies over broad managed policies.

✅ Use Bucket Policies for bucket-specific permissions.

✅ Regularly review IAM permissions.

✅ Avoid granting `AmazonS3FullAccess` unless absolutely necessary.

---

## ACLs, Block Public Access & Object Ownership

Amazon S3 provides multiple mechanisms to control access to buckets and objects.

Historically, Access Control Lists (ACLs) were the primary way to manage permissions. Today, AWS recommends using **IAM Policies**, **Bucket Policies**, and **Object Ownership**, while keeping **ACLs disabled** whenever possible.

### What is an Access Control List (ACL)?

An **Access Control List (ACL)** is one of the oldest permission mechanisms in Amazon S3.

ACLs allow you to grant permissions at:

- Bucket Level
- Object Level

Permissions can be granted to:

- AWS Accounts
- Predefined AWS Groups
- Log Delivery Services

Unlike IAM Policies and Bucket Policies, ACLs offer only a limited set of permissions.

### How ACLs Work

```
                S3 Bucket
                     │
        ┌────────────┴────────────┐
        │                         │
        ▼                         ▼
   Bucket ACL                Object ACL
        │                         │
        ▼                         ▼
 Read / Write             Read / Write
 Permissions              Permissions
```

Every bucket and object can have its own ACL.

### ACL Permissions

ACLs support only a few predefined permissions.

| Permission | Description |
|------------|-------------|
| READ | Download objects or list bucket contents |
| WRITE | Upload objects |
| READ_ACP | View the ACL |
| WRITE_ACP | Modify the ACL |
| FULL_CONTROL | Full permission |

Because ACLs are limited and difficult to manage, AWS recommends using IAM Policies and Bucket Policies instead.

### Why AWS Recommends Disabling ACLs

Managing permissions through ACLs can become confusing in large environments.

Problems include:

- Difficult to audit
- Hard to troubleshoot
- Duplicate permission management
- Increased risk of misconfiguration

AWS now recommends IAM Policies, Bucket Policies, and Object Ownership instead of ACLs.

### Object Ownership

Object Ownership determines who owns objects uploaded into an S3 bucket.

AWS provides three Object Ownership settings:

| Setting | Description |
|---------|-------------|
| Bucket Owner Enforced | ACLs disabled. Bucket owner owns all objects. *(Recommended)* |
| Bucket Owner Preferred | Bucket owner usually owns uploaded objects if ACLs allow it. |
| Object Writer | The uploader owns the object. *(Legacy behavior)* |

### Bucket Owner Enforced (Recommended)

This is the default and recommended configuration for new S3 buckets.

Features:

- ACLs are disabled.
- Bucket owner automatically owns every uploaded object.
- Access is managed only through IAM Policies and Bucket Policies.
- Simplifies security management.

```
Application
↓
Upload Object
↓
S3 Bucket
↓
Bucket Owner Automatically Owns Object
```

This prevents ownership conflicts between different AWS accounts.

### Block Public Access

One of the most important security features in Amazon S3 is **Block Public Access**.

It helps prevent accidental exposure of buckets and objects to the internet.

AWS enables this feature by default for new buckets.

```
Internet
↓
Block Public Access
↓
Amazon S3 Bucket
```

Even if someone mistakenly creates a public Bucket Policy or ACL, Block Public Access can prevent the bucket from becoming publicly accessible.

### Block Public Access Settings

Amazon S3 provides four Block Public Access options.

| Setting | Purpose |
|----------|---------|
| Block Public ACLs | Prevents public ACLs |
| Ignore Public ACLs | Ignores existing public ACLs |
| Block Public Bucket Policies | Prevents public bucket policies |
| Restrict Public Buckets | Restricts access even if a bucket policy allows public access |

For most production workloads, all four options should remain enabled.

### Public vs Private Buckets

**Private Bucket (Recommended)**

```
Users
↓
IAM Authentication
↓
Bucket Policy
↓
Private S3 Bucket
```

Only authorized users can access the data.

**Public Bucket**

```
Internet
↓
Public Bucket Policy
↓
S3 Bucket
↓
Anyone Can Access
```

Public buckets should only be used for content intended for everyone, such as public website images, static website assets, public documentation, or downloadable software packages.

Sensitive data should **never** be stored in a public bucket.

### Permission Evaluation Example

When a user requests access to an object:

```
User Request
↓
Authentication
↓
IAM Policy
↓
Bucket Policy
↓
Block Public Access
↓
Object Ownership
↓
Access Granted or Denied
```

AWS evaluates all applicable security controls before allowing access.

### Common Security Mistakes (ACLs & Public Access)

**❌ Disabling Block Public Access** — This is one of the most common causes of publicly exposed S3 buckets.

**❌ Using ACLs Instead of IAM Policies** — Modern AWS architectures should rely primarily on IAM Policies, Bucket Policies, and Object Ownership.

**❌ Granting Full S3 Access** — Avoid attaching policies such as `AmazonS3FullAccess` unless absolutely necessary. Grant only the required permissions.

**❌ Mixing Multiple Permission Models** — Using IAM Policies, Bucket Policies, and ACLs together without a clear design makes troubleshooting difficult. Keep permission management simple.

**❌ Ignoring Object Ownership** — Without Bucket Owner Enforced, uploaded objects may be owned by another AWS account, creating unexpected access issues.

### Real-World Scenario: Software Company Backups

A software company stores application backups in Amazon S3.

```
Application Server
↓
IAM Role
↓
Private S3 Bucket
↓
Object Ownership
↓
Bucket Owner Enforced
↓
Block Public Access Enabled
```

Security Configuration:

- ACLs Disabled
- Bucket Owner Enforced
- IAM Role for EC2
- Bucket Policy allowing only the application role
- Block Public Access enabled

This ensures that all backups remain private and fully controlled by the bucket owner.

### Best Practices (ACLs, Public Access & Ownership)

- Keep **Block Public Access** enabled.
- Use **Bucket Owner Enforced** for Object Ownership.
- Disable ACLs whenever possible.
- Manage access using IAM Policies and Bucket Policies.
- Grant only the minimum required permissions.
- Regularly audit bucket permissions using AWS IAM Access Analyzer.

---

## Encryption, Pre-Signed URLs & CORS

Protecting data is one of the most important aspects of Amazon S3 security. AWS provides multiple encryption options to secure data **at rest** (stored in S3) and **in transit** (moving between clients and S3).

In addition, Amazon S3 supports **Pre-Signed URLs** for secure file sharing and **Cross-Origin Resource Sharing (CORS)** for web applications.

### Data Encryption in Amazon S3

Encryption converts readable data into an unreadable format.

Only authorized users with the correct encryption keys can decrypt and access the data.

Amazon S3 supports encryption for:

- Data at Rest
- Data in Transit

```
Application
↓
Encrypt Data
↓
Amazon S3
↓
Encrypted Objects
```

Encryption protects sensitive information even if someone gains unauthorized access to the storage media.

### Server-Side Encryption (SSE)

With Server-Side Encryption, Amazon S3 automatically encrypts objects before storing them.

When an authorized user requests the object, Amazon S3 decrypts it automatically.

AWS provides three Server-Side Encryption methods: SSE-S3, SSE-KMS, and SSE-C.

#### SSE-S3 (Server-Side Encryption with Amazon S3 Managed Keys)

SSE-S3 is the easiest encryption option. AWS manages both the encryption process and the encryption keys.

**Features**

- AES-256 encryption
- No key management required
- Automatically encrypts uploaded objects
- Low administrative overhead

**Best Use Cases**

- Static websites
- Images
- Documents
- General application data

```
Upload Object
↓
Amazon S3
↓
AWS Managed Key
↓
Encrypted Storage
```

#### SSE-KMS (Server-Side Encryption with AWS KMS)

SSE-KMS uses **AWS Key Management Service (KMS)** to encrypt data. Unlike SSE-S3, you have full control over encryption keys.

**Features**

- Customer-managed keys
- Automatic key rotation
- CloudTrail auditing
- Fine-grained IAM permissions
- Key usage monitoring

**Best Use Cases**

- Banking Applications
- Healthcare Systems
- Government Projects
- Sensitive Customer Data
- Compliance Requirements

```
Application
↓
AWS KMS
↓
Encryption Key
↓
Amazon S3
↓
Encrypted Object
```

SSE-KMS is the recommended choice for organizations that require enhanced security and compliance.

#### SSE-C (Customer-Provided Keys)

With SSE-C, customers provide their own encryption keys during every upload and download request. AWS encrypts the data but does **not** store the encryption key.

**Features**

- Customer manages encryption keys
- AWS never stores the key
- Maximum customer control
- Higher operational complexity

**Best Use Cases**

- Organizations with strict internal key management policies
- Highly regulated environments

Because customers must securely manage the encryption keys themselves, SSE-C is less commonly used than SSE-S3 or SSE-KMS.

### Client-Side Encryption

Client-Side Encryption encrypts data **before** it is uploaded to Amazon S3. Amazon S3 stores only encrypted data.

```
Application
↓
Encrypt File
↓
Encrypted File
↓
Amazon S3
```

**Advantages**

- Encryption keys never leave your environment.
- AWS cannot decrypt the data.
- Provides an additional layer of security.

### Encryption Comparison

| Feature | SSE-S3 | SSE-KMS | SSE-C | Client-Side |
|----------|---------|----------|--------|-------------|
| Key Managed By | AWS | AWS KMS / Customer | Customer | Customer |
| Easy to Configure | ✅ Yes | ✅ Yes | ❌ No | ❌ No |
| Audit Logs | ❌ No | ✅ Yes | ❌ No | Depends on Application |
| Automatic Key Rotation | ❌ No | ✅ Yes | Customer Managed | Customer Managed |
| Best For | General Workloads | Sensitive Data | Custom Security | Maximum Security |

### Data Encryption in Transit

Encryption at rest protects stored data. Encryption in transit protects data while it travels across the network.

AWS recommends always using HTTPS instead of HTTP. HTTPS uses SSL/TLS encryption to protect data from interception.

### Pre-Signed URLs

A **Pre-Signed URL** is a temporary URL that grants secure access to an S3 object. Anyone possessing the URL can access the object until the URL expires.

**Example Workflow**

```
Application
↓
Generate Pre-Signed URL
↓
User
↓
Download Object
↓
URL Expires Automatically
```

**Benefits**

- Temporary access
- No AWS account required
- Secure file sharing
- Configurable expiration time

**Common Use Cases**

- Sharing reports
- Downloading invoices
- Temporary image uploads
- Secure document delivery
- Customer file uploads

### Cross-Origin Resource Sharing (CORS)

By default, browsers block requests made from one domain to another. Amazon S3 uses **CORS** to control cross-origin access.

**Example**

```
Frontend
https://mywebsite.com
↓
Request Image
↓
Amazon S3
↓
CORS Check
↓
Allow or Deny
```

Without CORS, browsers may block requests even if the object is publicly accessible.

**Example CORS Configuration**

```json
[
  {
    "AllowedOrigins": [
      "https://mywebsite.com"
    ],
    "AllowedMethods": [
      "GET",
      "PUT"
    ],
    "AllowedHeaders": [
      "*"
    ]
  }
]
```

This configuration allows the specified website to upload and download objects.

### Real-World Scenario: Online Shopping Application

An online shopping application stores product images in Amazon S3.

```
Customer
↓
Web Browser
↓
Frontend Website
↓
Amazon S3
↓
Product Images
```

Security Configuration:

- Default Encryption: SSE-KMS
- HTTPS Enabled
- CORS configured for the frontend domain
- Block Public Access enabled
- Images shared using Pre-Signed URLs where required

This ensures that customer data remains secure while allowing the application to function efficiently.

### Best Practices (Encryption, URLs & CORS)

- Enable default encryption for every bucket.
- Use **SSE-KMS** for sensitive or regulated data.
- Use HTTPS for all communication with Amazon S3.
- Generate short-lived Pre-Signed URLs.
- Configure CORS only for trusted domains.
- Rotate KMS keys regularly.
- Monitor encryption and key usage using AWS CloudTrail.

---

## Security Best Practices

Securing Amazon S3 is not just about enabling encryption or creating IAM policies. A strong security strategy combines multiple AWS security features to protect your data from unauthorized access.

### 1. Enable Block Public Access

Unless you are intentionally hosting public content, always keep **Block Public Access** enabled.

Benefits: prevents accidental public exposure, protects sensitive data, reduces security risks.

```
Internet
↓
Block Public Access
↓
Private S3 Bucket
```

### 2. Follow the Principle of Least Privilege

Grant users and applications only the permissions they need.

❌ Avoid: `AmazonS3FullAccess`

✅ Instead use: `s3:GetObject`, `s3:PutObject`, `s3:ListBucket`

This minimizes the impact of compromised credentials.

### 3. Use IAM Roles Instead of Access Keys

Never store AWS Access Keys inside source code, GitHub repositories, configuration files, or Docker images. Instead use IAM Roles.

```
EC2 Instance
↓
IAM Role
↓
Amazon S3
```

Temporary credentials are more secure than long-term access keys.

### 4. Enable Default Encryption

Always enable encryption for new buckets.

Recommended: SSE-S3 for general workloads, SSE-KMS for sensitive data.

Benefits: protects stored data, meets compliance requirements, requires minimal configuration.

### 5. Enable Versioning

Versioning protects against accidental deletion, file overwrite, and ransomware attacks.

```
report.pdf
↓
Version 1
↓
Version 2
↓
Version 3
```

Older versions remain available for recovery.

### 6. Enable Logging and Monitoring

Use AWS monitoring services to track bucket activity.

Recommended services: AWS CloudTrail, Amazon CloudWatch, AWS Config.

These services help detect unauthorized access, bucket changes, and suspicious API activity.

### 7. Review Bucket Policies Regularly

Regularly audit Bucket Policies, IAM Policies, IAM Roles, and Public Access settings. Remove unused permissions whenever possible.

---

## Troubleshooting Common Access Issues

One of the most common Amazon S3 errors is `Access Denied`. This usually indicates a permissions issue.

### Issue 1: Missing IAM Permission

**Problem:** `AccessDenied`

**Solution:** Verify that the IAM User or IAM Role has the required permissions, e.g. `s3:GetObject`, `s3:PutObject`, `s3:ListBucket`.

### Issue 2: Bucket Policy Denies Access

Even if IAM allows access, an explicit deny in the Bucket Policy overrides it.

```
IAM Allow
↓
Bucket Deny
↓
Final Result
↓
Access Denied
```

Remember: **Explicit Deny always wins.**

### Issue 3: Block Public Access Enabled

Sometimes developers create a public bucket policy but forget that Block Public Access is enabled.

```
Public Policy
+
Block Public Access
=
Access Denied
```

Always verify Block Public Access settings.

### Issue 4: KMS Permission Missing

If objects use SSE-KMS encryption, users also need permission to use the KMS key.

Required permissions include: `kms:Decrypt`, `kms:Encrypt`, `kms:GenerateDataKey`.

### Issue 5: Wrong Object Ownership

If Bucket Owner Enforced is not enabled, uploaded objects may belong to another AWS account.

**Solution:** Enable Bucket Owner Enforced.

---

## Real-World Security Architecture

Below is an example of a secure production architecture.

```
Users
↓
Application Load Balancer
↓
Amazon EC2
↓
IAM Role
↓
Private Amazon S3 Bucket
↓
SSE-KMS Encryption
↓
CloudTrail Logging
↓
CloudWatch Monitoring
```

Security Features:

- IAM Role authentication
- Bucket Policy
- Block Public Access
- Bucket Owner Enforced
- SSE-KMS encryption
- CloudTrail auditing
- CloudWatch monitoring

This architecture follows AWS security best practices.

---

## Security Checklist

Before deploying an Amazon S3 bucket, verify the following:

| Checklist | Status |
|-----------|---------|
| Block Public Access Enabled | ✅ |
| IAM Role Used | ✅ |
| Least Privilege Applied | ✅ |
| Default Encryption Enabled | ✅ |
| Bucket Policy Reviewed | ✅ |
| Versioning Enabled | ✅ |
| CloudTrail Enabled | ✅ |
| CloudWatch Monitoring Enabled | ✅ |
| Object Ownership Configured | ✅ |
| ACLs Disabled | ✅ |

---

## Interview Questions

**1. What is the difference between Authentication and Authorization?**

Authentication verifies the identity of a user. Authorization determines what actions that user is allowed to perform.

**2. What is the difference between an IAM Policy and a Bucket Policy?**

IAM Policy → Attached to Users, Groups, or Roles. Bucket Policy → Attached directly to an S3 Bucket.

**3. Which permission overrides all others?**

Explicit Deny.

**4. What is Block Public Access?**

A security feature that prevents buckets or objects from becoming publicly accessible.

**5. Which encryption method provides the highest level of AWS-managed control?**

SSE-KMS.

**6. What is a Pre-Signed URL?**

A temporary URL that grants time-limited access to an S3 object without requiring AWS credentials.

**7. Why does AWS recommend disabling ACLs?**

Because IAM Policies, Bucket Policies, and Object Ownership provide a simpler and more secure permission model.

**8. What is Bucket Owner Enforced?**

A setting that disables ACLs and ensures the bucket owner automatically owns all uploaded objects.

**9. Which AWS service manages encryption keys?**

AWS Key Management Service (AWS KMS).

**10. Which AWS service records API activity for Amazon S3?**

AWS CloudTrail.

---

## Summary

In this guide, you learned:

- Amazon S3 Security Fundamentals
- Shared Responsibility Model
- Authentication vs Authorization
- IAM Users, Groups, Roles, and Policies
- Bucket Policies
- Access Control Lists (ACLs)
- Object Ownership
- Block Public Access
- Server-Side Encryption (SSE-S3, SSE-KMS, SSE-C)
- Client-Side Encryption
- HTTPS and Encryption in Transit
- Pre-Signed URLs
- Cross-Origin Resource Sharing (CORS)
- Security Best Practices
- Troubleshooting Common Access Issues
- AWS Security Interview Questions

By combining these security features, you can build secure, scalable, and compliant Amazon S3 environments that follow AWS Well-Architected Framework recommendations.

---

## 🎉 Congratulations!

You have successfully completed **Amazon S3 Security & Permissions**.

You can now:

- ✅ Secure Amazon S3 buckets using AWS best practices
- ✅ Configure IAM Policies and Bucket Policies
- ✅ Understand ACLs and Object Ownership
- ✅ Protect data with encryption
- ✅ Share files securely using Pre-Signed URLs
- ✅ Configure CORS for web applications
- ✅ Troubleshoot common permission issues
- ✅ Build secure production-ready S3 architectures

You are now ready to learn **Amazon S3 Versioning and Lifecycle Management**, one of the most practical features for data protection and cost optimization — covering versioning, delete markers, recovering deleted objects, lifecycle rules, storage class transitions, and automatic object expiration.
