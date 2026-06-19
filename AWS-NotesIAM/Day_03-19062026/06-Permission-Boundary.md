# AWS Permission Boundaries

> **Day 06 – AWS IAM Complete Guide**
> **Author:** Newton Babu Nandru

---

# What is a Permission Boundary?

A **Permission Boundary** is an advanced IAM feature that **sets the maximum permissions** an IAM User or IAM Role can have.

Think of it as a **permission limit**.

> **Key Point:** A Permission Boundary **does not grant permissions**. It only defines the **maximum permissions** that can be granted through IAM policies.

---

# Why Do We Need Permission Boundaries?

In large organizations, developers may be allowed to create IAM users or roles.

Without Permission Boundaries:

* Developers might accidentally create users with **AdministratorAccess**.
* This could lead to privilege escalation.

With Permission Boundaries:

* Administrators define the **maximum permissions** developers can assign.
* Even if a developer attaches `AdministratorAccess`, the boundary prevents access beyond the defined limit.

---

# Real-World Example

Imagine a company has a junior cloud engineer.

The engineer can create IAM users but **must not** grant administrator permissions.

```text
Administrator
      │
Creates Permission Boundary
      │
Maximum Permission = EC2 + S3 ReadOnly
      │
      ▼
Developer Creates IAM User
      │
Attaches AdministratorAccess
      │
      ▼
Effective Permission
      │
      ▼
EC2 + S3 ReadOnly Only
```

The boundary prevents the user from becoming an administrator.

---

# Permission Boundary Architecture

```text
                 IAM Policy
          AdministratorAccess
                 │
                 ▼
        +-------------------+
        | Permission        |
        | Boundary          |
        | EC2 + S3 ReadOnly |
        +-------------------+
                 │
                 ▼
        Effective Permission
                 │
                 ▼
       EC2 + S3 ReadOnly
```

---

# How Permission Evaluation Works

AWS calculates permissions like this:

```text
IAM Policy
      │
      ▼
Permission Boundary
      │
      ▼
Intersection
      │
      ▼
Final Permission
```

Only the permissions allowed by **both** the IAM policy and the Permission Boundary are granted.

---

# Example

## IAM Policy

Allows:

* EC2 Full Access
* S3 Full Access
* IAM Full Access

## Permission Boundary

Allows only:

* EC2 Full Access

### Final Result

| Service | Access    |
| ------- | --------- |
| EC2     | ✅ Allowed |
| S3      | ❌ Denied  |
| IAM     | ❌ Denied  |

Only EC2 access is effective because it exists in both the policy and the boundary.

---

# Permission Boundary vs IAM Policy

| IAM Policy                          | Permission Boundary             |
| ----------------------------------- | ------------------------------- |
| Grants permissions                  | Limits permissions              |
| Defines what is allowed             | Defines the maximum allowed     |
| Required for access                 | Optional security control       |
| Attached to Users, Groups, or Roles | Attached only to Users or Roles |

---

# Permission Boundary vs SCP

| Permission Boundary                         | SCP                                       |
| ------------------------------------------- | ----------------------------------------- |
| Applies to IAM Users and Roles              | Applies to AWS Accounts                   |
| Controls maximum permissions for identities | Controls maximum permissions for accounts |
| Used within one AWS account                 | Used across AWS Organizations             |
| Fine-grained identity control               | Organization-wide governance              |

---

# Hands-On Lab

## Objective

Allow developers to create IAM users, but prevent them from assigning AdministratorAccess.

### Step 1

Create a Customer Managed Policy.

Example policy:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:*",
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "*"
    }
  ]
}
```

### Step 2

Create a Permission Boundary using this policy.

### Step 3

Create an IAM User.

### Step 4

Attach:

* AdministratorAccess
* Permission Boundary

### Step 5

Test access.

Result:

* ✅ EC2 works.
* ✅ S3 read works.
* ❌ IAM actions fail.
* ❌ Other administrator actions are denied.

---

# AWS CLI Commands

## Create a Boundary Policy

```bash
aws iam create-policy \
--policy-name DevBoundary \
--policy-document file://boundary.json
```

---

## Apply Boundary to a User

```bash
aws iam put-user-permissions-boundary \
--user-name dev1 \
--permissions-boundary arn:aws:iam::123456789012:policy/DevBoundary
```

---

## Apply Boundary to a Role

```bash
aws iam put-role-permissions-boundary \
--role-name EC2Role \
--permissions-boundary arn:aws:iam::123456789012:policy/DevBoundary
```

---

## Remove Boundary

```bash
aws iam delete-user-permissions-boundary \
--user-name dev1
```

---

# Best Practices

* Use Permission Boundaries when delegating IAM administration.
* Combine with the Principle of Least Privilege.
* Do not rely on Permission Boundaries alone; also use IAM policies and SCPs where appropriate.
* Review boundary policies regularly.
* Use Customer Managed Policies as permission boundaries.

---

# Common Use Cases

* Large enterprises
* Multi-team AWS environments
* Self-service IAM user creation
* DevOps platforms
* Landing Zone implementations
* Enterprise cloud governance

---

# Interview Questions

### What is a Permission Boundary?

A Permission Boundary defines the **maximum permissions** an IAM User or IAM Role can receive.

---

### Does a Permission Boundary grant permissions?

No. It only limits the permissions that can be granted by IAM policies.

---

### Can Permission Boundaries be attached to IAM Groups?

No. They can only be attached to **IAM Users** and **IAM Roles**.

---

### What happens if an IAM Policy allows an action but the Permission Boundary denies it?

The action is denied because the Permission Boundary limits the maximum effective permissions.

---

### What is the difference between a Permission Boundary and an SCP?

A Permission Boundary limits permissions for IAM Users and Roles within an AWS account, while an SCP limits permissions across AWS accounts in an AWS Organization.

---

# Key Takeaways

* Permission Boundaries define the **maximum permissions** for IAM Users and Roles.
* They **do not grant permissions**.
* Effective permissions are the intersection of the IAM policy and the Permission Boundary.
* Permission Boundaries help prevent privilege escalation.
* They are commonly used in enterprise AWS environments where IAM management is delegated.

---

# Summary

Permission Boundaries are an advanced IAM feature that helps administrators safely delegate IAM management. They act as a safety guardrail by limiting the maximum permissions that users and roles can obtain, even if broader IAM policies are attached.

---

## Quick Revision

```text
IAM Policy
      │
      ▼
Grants Permissions

Permission Boundary
      │
      ▼
Limits Maximum Permissions

Final Access
      │
      ▼
Policy ∩ Boundary
```

---

**Author:** Newton Babu Nandru
**Project:** AWS-IAM-Complete-Guide
**Day:** 06 – Permission Boundaries

