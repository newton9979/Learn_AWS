# 07 - AWS Organizations Service Control Policies (SCP)

> **AWS IAM Complete Guide**
> **Day 07 – Service Control Policies (SCP)**

---

# 📚 Learning Objectives

After completing this chapter, you will learn:

* What is AWS Organizations?
* What is a Service Control Policy (SCP)?
* Why SCP is used
* How SCP works
* SCP Evaluation Process
* SCP vs IAM Policies
* Real-world Use Cases
* Hands-on Lab
* Best Practices
* Interview Questions

---

# What is an SCP?

A **Service Control Policy (SCP)** is a policy available in **AWS Organizations** that defines the **maximum permissions** available for AWS accounts.

> **Important:** SCPs do **NOT** grant permissions. They only **limit** permissions.

Think of an SCP as a **security guard**. Even if an IAM user has `AdministratorAccess`, the SCP can still deny specific AWS actions.

---

# Why Do We Need SCP?

Organizations use SCPs to enforce security rules across multiple AWS accounts.

### Example

A company wants to ensure:

* Developers cannot delete S3 buckets.
* CloudTrail cannot be disabled.
* IAM users cannot be created outside the Security Team.

SCPs make these rules apply to every account in the organization.

---

# AWS Organizations Structure

```text
AWS Organization
│
├── Root
│
├── Production OU
│   ├── Account A
│   └── Account B
│
├── Development OU
│   ├── Account C
│   └── Account D
│
└── Testing OU
    └── Account E
```

SCPs can be attached to:

* Root
* Organizational Unit (OU)
* AWS Account

---

# How SCP Works

```text
        User Request
             │
             ▼
        IAM Policy
             │
             ▼
 Permission Boundary
             │
             ▼
     Service Control Policy
             │
             ▼
      Resource Policy
             │
             ▼
       AWS Service
```

Every layer must allow the request.

If **SCP denies**, the request is denied—even if IAM policies allow it.

---

# Example 1

### IAM Policy

```text
AdministratorAccess
```

### SCP

```text
Deny S3 DeleteBucket
```

### User Action

```text
Delete S3 Bucket
```

### Result

```text
❌ Access Denied
```

Reason:

The SCP blocks the action.

---

# Example SCP Policy

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyDeleteBucket",
      "Effect": "Deny",
      "Action": "s3:DeleteBucket",
      "Resource": "*"
    }
  ]
}
```

---

# Real-World Example

Imagine a company has three AWS accounts:

```text
Company
│
├── Production
├── Development
└── Sandbox
```

Management decides:

* Nobody can delete S3 buckets.
* Nobody can stop CloudTrail.
* Only the Security Team can manage IAM.

Instead of configuring every account separately, the company attaches SCPs at the Organizational Unit (OU) level.

---

# SCP vs IAM Policy

| Feature                     | IAM Policy | SCP   |
| --------------------------- | ---------- | ----- |
| Grants Permissions          | ✅ Yes      | ❌ No  |
| Restricts Permissions       | ❌ No       | ✅ Yes |
| Works on IAM Users/Roles    | ✅ Yes      | ❌ No  |
| Works on AWS Accounts       | ❌ No       | ✅ Yes |
| Requires AWS Organizations  | ❌ No       | ✅ Yes |
| Defines Maximum Permissions | ❌ No       | ✅ Yes |

---

# Hands-on Lab

## Task 1

Create an AWS Organization.

---

## Task 2

Create two Organizational Units.

```text
Production
Development
```

---

## Task 3

Create a member AWS account.

```text
Dev Account
```

---

## Task 4

Create the following SCP.

```json
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Effect":"Deny",
      "Action":"s3:DeleteBucket",
      "Resource":"*"
    }
  ]
}
```

Attach it to the **Development OU**.

---

## Task 5

Login to the Development account.

Assign the user:

```text
AdministratorAccess
```

Try to delete an S3 bucket.

### Expected Result

```text
❌ Access Denied
```

The SCP overrides the IAM permission.

---

# Best Practices

* Use SCPs only for organization-wide guardrails.
* Apply the Principle of Least Privilege.
* Test SCPs in a Sandbox OU before Production.
* Avoid overly restrictive SCPs on the Root.
* Document every SCP.
* Review SCPs regularly.
* Monitor changes using AWS CloudTrail.

---

# Common Use Cases

* Prevent deletion of production resources.
* Block disabling CloudTrail.
* Restrict AWS Regions.
* Prevent creation of IAM users.
* Restrict expensive AWS services.
* Enforce organization-wide security standards.

---

# Interview Questions

### 1. What is an SCP?

A Service Control Policy defines the maximum permissions available to AWS accounts in an AWS Organization.

---

### 2. Can SCP grant permissions?

No. SCPs only limit permissions.

---

### 3. Does AdministratorAccess bypass an SCP?

No. SCPs apply even to users with AdministratorAccess.

---

### 4. Where can SCPs be attached?

* Root
* Organizational Unit (OU)
* AWS Account

---

### 5. Is AWS Organizations required for SCP?

Yes.

---

# Key Takeaways

* SCP is a feature of AWS Organizations.
* SCP defines the maximum permissions available.
* SCP never grants permissions.
* SCP affects all IAM users and roles within the targeted accounts.
* Even AdministratorAccess cannot bypass an SCP.
* SCPs are used to enforce organization-wide security guardrails.

---

# Repository Progress

| Topic                          | Status    |
| ------------------------------ | --------- |
| Introduction                   | Completed |
| IAM Users                      | Completed |
| IAM Groups                     | Completed |
| IAM Roles                      | Completed |
| IAM Policies                   | Completed |
| Permissions Boundary           | Completed |
| Service Control Policies (SCP) | Completed |

---

## Next Chapter

➡️ **08-IAM-Best-Practices.md**

---

### Author

**Newton Babu Nandru**
*AWS Cloud & DevOps Enthusiast*

