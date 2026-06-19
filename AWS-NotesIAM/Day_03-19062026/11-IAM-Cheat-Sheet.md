# AWS IAM Cheat Sheet

> **Day 11 - AWS IAM Complete Guide**
>
> **Quick Revision Notes for AWS IAM**
>
> **Author:** Newton Babu Nandru

---

# AWS IAM Cheat Sheet

This cheat sheet provides a quick overview of the most important AWS IAM concepts. It is designed for interview preparation, AWS certification, and day-to-day DevOps work.

---

# IAM Components

| Component           | Purpose                                                   |
| ------------------- | --------------------------------------------------------- |
| IAM User            | Represents a single person or application                 |
| IAM Group           | Collection of IAM Users                                   |
| IAM Role            | Temporary permissions assumed by users or AWS services    |
| IAM Policy          | JSON document that grants or denies permissions           |
| Permission Boundary | Maximum permissions an IAM user or role can receive       |
| SCP                 | Maximum permissions for AWS accounts in AWS Organizations |

---

# IAM Architecture

```text
                    AWS Organization
                           │
                           ▼
                 Service Control Policy
                           │
                           ▼
                     AWS Account
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
     IAM User         IAM Group         IAM Role
        │                  │                  │
        └──────────────┬───┘                  │
                       ▼                      ▼
                 IAM Policies         AWS Services
                       │
                       ▼
             Permission Boundary
```

---

# IAM Authentication

✔ Username + Password

✔ Access Key

✔ Multi-Factor Authentication (MFA)

✔ AWS CLI

✔ AWS SDK

✔ AWS Console

---

# IAM Authorization Flow

```text
User Login
     │
     ▼
Authentication
     │
     ▼
IAM Policy Evaluation
     │
     ▼
Permission Boundary
     │
     ▼
Service Control Policy
     │
     ▼
Allow or Deny
```

---

# IAM Policy Types

| Policy           | Description                                   |
| ---------------- | --------------------------------------------- |
| AWS Managed      | Created and maintained by AWS                 |
| Customer Managed | Created by your organization                  |
| Inline Policy    | Attached directly to one user, group, or role |

---

# IAM Policy Structure

```json
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Effect":"Allow",
      "Action":"s3:*",
      "Resource":"*"
    }
  ]
}
```

---

# IAM Policy Elements

| Element   | Purpose                 |
| --------- | ----------------------- |
| Version   | Policy language version |
| Statement | Policy block            |
| Effect    | Allow or Deny           |
| Action    | AWS API actions         |
| Resource  | AWS resources           |
| Condition | Optional conditions     |

---

# IAM Best Practices

✅ Enable MFA

✅ Follow Least Privilege Principle

✅ Rotate Access Keys

✅ Use IAM Roles instead of Access Keys

✅ Never share Root User credentials

✅ Enable CloudTrail

✅ Use IAM Groups

✅ Use Customer Managed Policies

✅ Use Permission Boundaries

✅ Use SCP in Organizations

---

# IAM Evaluation Logic

```text
Explicit Deny
      ▲
      │
Highest Priority

Permission Boundary

IAM Policy

Resource Policy

SCP

If everything allows
      │
      ▼
Final Result = Allow
```

---

# IAM Users vs Groups vs Roles

| Feature               | User | Group | Role |
| --------------------- | ---- | ----- | ---- |
| Login                 | ✅    | ❌     | ❌    |
| Password              | ✅    | ❌     | ❌    |
| Access Keys           | ✅    | ❌     | ❌    |
| Temporary Credentials | ❌    | ❌     | ✅    |
| Used by AWS Services  | ❌    | ❌     | ✅    |

---

# Permission Boundary vs SCP

| Feature    | Permission Boundary     | SCP                         |
| ---------- | ----------------------- | --------------------------- |
| Applies To | User / Role             | AWS Account                 |
| Controls   | Maximum IAM permissions | Maximum Account permissions |
| Works With | IAM                     | AWS Organizations           |
| Default    | Not Enabled             | Not Enabled                 |

---

# IAM CLI Commands

## Create User

```bash
aws iam create-user --user-name DevOpsUser
```

---

## List Users

```bash
aws iam list-users
```

---

## Create Group

```bash
aws iam create-group --group-name DevOps
```

---

## Add User to Group

```bash
aws iam add-user-to-group \
--user-name DevOpsUser \
--group-name DevOps
```

---

## Create Role

```bash
aws iam create-role \
--role-name EC2Role \
--assume-role-policy-document file://trust.json
```

---

## List Roles

```bash
aws iam list-roles
```

---

## Attach Policy

```bash
aws iam attach-user-policy \
--user-name DevOpsUser \
--policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
```

---

## List Policies

```bash
aws iam list-policies
```

---

# Common AWS Managed Policies

| Policy                  | Purpose                           |
| ----------------------- | --------------------------------- |
| AdministratorAccess     | Full AWS access                   |
| AmazonS3ReadOnlyAccess  | Read-only S3                      |
| AmazonEC2ReadOnlyAccess | Read-only EC2                     |
| IAMReadOnlyAccess       | Read-only IAM                     |
| PowerUserAccess         | Full access except IAM management |

---

# Root User Recommendations

❌ Never create Access Keys

❌ Never use Root for daily work

✅ Enable MFA

✅ Use Root only for account-level tasks

---

# Interview Quick Facts

✔ IAM is a Global Service

✔ IAM Policies are written in JSON

[O✔ Explicit Deny always wins

✔ Roles provide temporary credentials

✔ Groups cannot contain Groups

✔ Roles do not have passwords

✔ SCP cannot grant permissions

✔ Permission Boundary never grants permissions

✔ IAM supports MFA

✔ Least Privilege is an AWS security best practice

---

# Real-World Scenario

```text
Company
   │
   ▼
AWS Organization
   │
   ▼
SCP
   │
   ▼
AWS Account
   │
   ▼
IAM Group (Developers)
   │
   ▼
IAM Users
   │
   ▼
Permission Boundary
   │
   ▼
EC2 Role
   │
   ▼
Amazon S3
```

---

# Day 11 Summary

After completing this guide, you should understand:

* IAM fundamentals
* IAM Users
* IAM Groups
* IAM Roles
* IAM Policies
* Permission Boundaries
* Service Control Policies (SCP)
* IAM Best Practices
* IAM CLI Commands
* Interview Questions
* Hands-On Labs
* AWS Security Best Practices

---

# Repository Structure

```text
AWS-IAM-Complete-Guide/
│
├── docs/
│   ├── 01-Introduction.md
│   ├── 02-IAM-Users.md
│   ├── 03-IAM-Groups.md
│   ├── 04-IAM-Roles.md
│   ├── 05-IAM-Policies.md
│   ├── 06-Permission-Boundary.md
│   ├── 07-SCP.md
│   ├── 08-IAM-Best-Practices.md
│   ├── 09-IAM-Interview-Questions.md
│   ├── 10-IAM-Hands-On-Lab.md
│   └── 11-IAM-Cheat-Sheet.md
│
├── images/
│   ├── Day-01-IAM-Overview.png
│   ├── Day-02-IAM-Policies.png
│   └── Day-03-AWS-IAM-Users-Groups-Roles-Permissions-Boundary-SCP.png
│
└── README.md
```

---

# Key Takeaways

* IAM is the foundation of AWS security.
* Always apply the Principle of Least Privilege.
* Use IAM Roles instead of long-term access keys whenever possible.
* Protect accounts with MFA and regular key rotation.
* Use Permission Boundaries and SCPs to enforce guardrails.
* Remember: **Explicit Deny always overrides Allow**.

---

## ✍️ Author

**Newton Babu Nandru**

**Senior Linux & Production Support Engineer**

*Learning AWS Cloud & DevOps | Building Projects | Sharing Knowledge*

