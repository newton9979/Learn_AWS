# AWS IAM Policies

> **Day 05 – AWS IAM Complete Guide**
> **Author:** Newton Babu Nandru

---

# What is an IAM Policy?

An **IAM Policy** is a JSON document that defines **what actions are allowed or denied** on AWS resources.

Policies are attached to:

* IAM Users
* IAM Groups
* IAM Roles

> **Key Point:** A policy **does not create permissions by itself**. Permissions become effective only after the policy is attached to a user, group, or role.

---

# Why Do We Need IAM Policies?

IAM Policies help enforce the **Principle of Least Privilege**, ensuring users and services receive only the permissions they need.

### Example

A developer may only need to:

* View EC2 instances
* Start EC2 instances
* Stop EC2 instances

The developer should **not** be able to delete EC2 instances.

---

# IAM Policy Architecture

```text
                IAM Policy
                     │
                     ▼
        +------------------------+
        | Allow EC2 Read Access  |
        +------------------------+
             │      │       │
             ▼      ▼       ▼
          User   Group    Role
```

---

# IAM Policy Structure

An IAM Policy is written in **JSON**.

Example:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "*"
    }
  ]
}
```

---

# IAM Policy Elements

| Element   | Description                                  |
| --------- | -------------------------------------------- |
| Version   | Policy language version                      |
| Statement | One or more permission rules                 |
| Effect    | Allow or Deny                                |
| Action    | AWS API actions (e.g., `ec2:StartInstances`) |
| Resource  | AWS resources affected                       |
| Condition | Optional rules for when the policy applies   |

---

# Types of IAM Policies

## 1. AWS Managed Policies

* Created and maintained by AWS
* Ready to use
* Automatically updated by AWS

Example:

```text
AmazonS3ReadOnlyAccess
AdministratorAccess
AmazonEC2ReadOnlyAccess
```

---

## 2. Customer Managed Policies

* Created and managed by your organization
* Reusable across multiple users, groups, and roles
* Recommended for custom permission requirements

---

## 3. Inline Policies

* Attached directly to a single user, group, or role
* Cannot be shared
* Deleted automatically if the identity is deleted

---

# Managed vs Inline Policies

| Managed Policy                         | Inline Policy                 |
| -------------------------------------- | ----------------------------- |
| Reusable                               | One-to-one relationship       |
| Can be attached to multiple identities | Attached to only one identity |
| Easier to manage                       | Harder to maintain            |
| Recommended                            | Use only for special cases    |

---

# Policy Evaluation Logic

```text
User Requests Access
         │
         ▼
 IAM Evaluates Policies
         │
         ▼
Is there an Explicit Deny?
         │
    Yes ─────► Access Denied
         │
        No
         │
Is there an Allow?
         │
    Yes ─────► Access Allowed
         │
        No
         ▼
 Default Deny
```

> **Rule:** **Explicit Deny always overrides Allow.**

---

# Hands-On Lab

## Objective

Create a custom policy that allows users to view S3 buckets.

### Step 1

Open **IAM Console**

### Step 2

Go to **Policies**

### Step 3

Click **Create Policy**

### Step 4

Choose **JSON**

Paste:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:GetObject"
      ],
      "Resource": "*"
    }
  ]
}
```

### Step 5

Save the policy.

### Step 6

Attach it to an IAM User or Group.

### Step 7

Log in as that user and verify access to Amazon S3.

---

# AWS CLI Commands

## List Policies

```bash
aws iam list-policies
```

---

## Create a Customer Managed Policy

```bash
aws iam create-policy \
--policy-name S3ReadOnly \
--policy-document file://policy.json
```

---

## Attach Policy to a User

```bash
aws iam attach-user-policy \
--user-name dev1 \
--policy-arn arn:aws:iam::123456789012:policy/S3ReadOnly
```

---

## Attach Policy to a Group

```bash
aws iam attach-group-policy \
--group-name Developers \
--policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess
```

---

## Attach Policy to a Role

```bash
aws iam attach-role-policy \
--role-name EC2-S3-Role \
--policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
```

---

# Best Practices

* Follow the Principle of Least Privilege.
* Prefer AWS Managed Policies when they meet your needs.
* Use Customer Managed Policies for reusable custom permissions.
* Avoid using `AdministratorAccess` unless necessary.
* Regularly review and remove unused permissions.
* Use explicit denies carefully to enforce security boundaries.

---

# Interview Questions

### What is an IAM Policy?

An IAM Policy is a JSON document that defines permissions for AWS resources.

---

### What are the three types of IAM Policies?

* AWS Managed Policies
* Customer Managed Policies
* Inline Policies

---

### What is the difference between Managed and Inline Policies?

Managed Policies can be attached to multiple identities and reused. Inline Policies are attached to a single identity and cannot be reused.

---

### Which takes precedence: Allow or Deny?

**Explicit Deny** always overrides **Allow**.

---

### What is the default behavior if no policy allows an action?

The request is **denied by default**.

---

# Key Takeaways

* IAM Policies define **who can do what on which resources**.
* Policies are written in **JSON**.
* Policies can be attached to users, groups, and roles.
* Managed Policies are reusable; Inline Policies are tied to one identity.
* AWS evaluates policies using **Explicit Deny → Allow → Default Deny**.

---

# Summary

IAM Policies are the foundation of AWS access management. They specify which actions are permitted or denied on AWS resources. Understanding policy types, JSON structure, and evaluation logic is essential for building secure AWS environments and is a key topic in AWS certification exams and DevOps interviews.

---

## Quick Revision

```text
IAM Policy
     │
     ├── AWS Managed Policy
     ├── Customer Managed Policy
     └── Inline Policy

Policy Evaluation

Explicit Deny
      │
      ▼
    Highest Priority

Allow
      │
      ▼
If No Deny Exists

No Allow
      │
      ▼
Default Deny
```

---

**Author:** Newton Babu Nandru
**Project:** AWS-IAM-Complete-Guide
**Day:** 05 – IAM Policies

