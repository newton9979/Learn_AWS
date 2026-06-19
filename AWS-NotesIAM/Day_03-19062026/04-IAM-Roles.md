# AWS IAM Roles

> **Day 04 – AWS IAM Complete Guide**
> **Author:** Newton Babu Nandru

---

# What is an IAM Role?

An **IAM Role** is an AWS identity that provides **temporary permissions** to trusted users, AWS services, or external accounts.

Unlike an IAM User, a role **does not have a username, password, or access keys**. Instead, it is **assumed** when needed.

> **Key Point:** IAM Roles are designed for **temporary access** and are commonly used by AWS services such as EC2, Lambda, and ECS.

---

# Why Do We Need IAM Roles?

Without IAM Roles:

* You would need to store AWS Access Keys on EC2 instances or applications.
* Managing long-term credentials becomes difficult and insecure.

With IAM Roles:

* AWS automatically provides **temporary security credentials**.
* No need to store or rotate access keys.
* Improves security and simplifies access management.

---

# Real-World Example

Suppose an EC2 instance needs to read files from an S3 bucket.

❌ **Bad Practice**

```text
EC2 Instance
      │
      ▼
Store IAM User Access Keys
      │
      ▼
Access S3
```

Problems:

* Keys can be exposed.
* Manual rotation is required.
* Higher security risk.

---

✅ **Best Practice**

```text
EC2 Instance
      │
      ▼
Assume IAM Role
      │
      ▼
Temporary Credentials
      │
      ▼
Access S3 Bucket
```

No access keys are stored on the server.

---

# IAM Role Architecture

```text
              IAM Role
        +-------------------+
        |  S3 Read Access   |
        +-------------------+
                  ▲
                  │
         Assume Role
                  │
          +---------------+
          | EC2 Instance  |
          +---------------+
                  │
                  ▼
             Amazon S3
```

---

# Characteristics of IAM Roles

* No username or password
* No long-term access keys
* Provides temporary credentials
* Can be assumed by users, AWS services, or external accounts
* More secure than storing access keys

---

# Common IAM Role Use Cases

| Use Case             | Example                           |
| -------------------- | --------------------------------- |
| EC2 → S3             | EC2 reads files from S3           |
| Lambda → DynamoDB    | Lambda accesses DynamoDB          |
| ECS → ECR            | ECS pulls Docker images           |
| Cross-Account Access | One AWS account accesses another  |
| AWS Backup           | Backup service accesses resources |

---

# Types of IAM Roles

## 1. AWS Service Role

Used by AWS services.

Examples:

* EC2
* Lambda
* ECS
* CloudFormation

---

## 2. Cross-Account Role

Allows one AWS account to access resources in another account.

Example:

```text
AWS Account A
      │
Assume Role
      │
▼
AWS Account B
```

---

## 3. Identity Provider (Federation)

Used for:

* Google
* Microsoft Entra ID (Azure AD)
* Okta
* Active Directory

Users sign in without creating IAM Users.

---

# Hands-On Lab

## Objective

Allow an EC2 instance to access an S3 bucket without using access keys.

### Step 1

Open **IAM Console**.

### Step 2

Click **Roles**.

### Step 3

Select:

```
AWS Service
```

### Step 4

Choose:

```
EC2
```

### Step 5

Attach Policy:

```
AmazonS3ReadOnlyAccess
```

### Step 6

Role Name:

```
EC2-S3-ReadOnly-Role
```

### Step 7

Launch an EC2 instance.

### Step 8

Attach the IAM Role to the EC2 instance.

### Step 9

Connect to the instance.

Verify:

```bash
aws s3 ls
```

You should see the list of accessible S3 buckets without configuring access keys.

---

# AWS CLI Commands

## Create Role

```bash
aws iam create-role \
--role-name EC2-S3-Role \
--assume-role-policy-document file://trust-policy.json
```

---

## Attach Policy

```bash
aws iam attach-role-policy \
--role-name EC2-S3-Role \
--policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
```

---

## List Roles

```bash
aws iam list-roles
```

---

## Delete Role

```bash
aws iam delete-role \
--role-name EC2-S3-Role
```

---

# IAM Role vs IAM User

| IAM User           | IAM Role                                     |
| ------------------ | -------------------------------------------- |
| Permanent identity | Temporary identity                           |
| Has password       | No password                                  |
| Has access keys    | Temporary credentials                        |
| Used by people     | Used by AWS services, applications, or users |
| Long-term access   | Short-term access                            |

---

# Best Practices

* Never store AWS access keys on EC2 instances.
* Use IAM Roles for AWS services.
* Grant only the permissions required (Least Privilege).
* Rotate and review role permissions regularly.
* Use temporary credentials whenever possible.

---

# Interview Questions

### What is an IAM Role?

An IAM Role is an AWS identity that provides **temporary permissions** to trusted users, AWS services, or external accounts.

---

### Does an IAM Role have a password?

No.

---

### Can an IAM Role have access keys?

No.

---

### What is an Assume Role?

Assume Role is the process of obtaining temporary security credentials by using an IAM Role.

---

### Why are IAM Roles more secure than IAM Users for EC2?

Because IAM Roles use temporary credentials managed by AWS, eliminating the need to store long-term access keys.

---

### Can one IAM Role be assumed by another AWS account?

Yes. This is known as **Cross-Account Access**.

---

# Key Takeaways

* IAM Roles provide **temporary security credentials**.
* Roles do not have passwords or access keys.
* AWS services commonly use IAM Roles.
* IAM Roles improve security by eliminating long-term credentials.
* EC2, Lambda, ECS, and CloudFormation frequently rely on IAM Roles.
* Cross-account access is achieved using IAM Roles.

---

# Summary

IAM Roles are one of the most important AWS security features. They enable secure, temporary access to AWS resources without exposing long-term credentials. Using IAM Roles is considered an AWS security best practice for applications, services, and cross-account access.

---

## Quick Revision

```text
IAM User
    │
Permanent Identity
    │
Long-Term Credentials

IAM Role
    │
Temporary Identity
    │
Temporary Credentials
    │
Assume When Needed
```

---

**Author:** Newton Babu Nandru
**Project:** AWS-IAM-Complete-Guide
**Day:** 04 – IAM Roles

