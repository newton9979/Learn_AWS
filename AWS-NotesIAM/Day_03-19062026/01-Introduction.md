# AWS Identity and Access Management (IAM) - Introduction

> **Day 01 - AWS IAM Introduction**
>
> **Repository:** AWS IAM Complete Guide
>
> **Author:** Newton Babu Nandru

---

# 📖 Table of Contents

* What is AWS IAM?
* Why Do We Need IAM?
* Authentication vs Authorization
* IAM Components
* How IAM Works
* Real-World Example
* IAM Architecture
* Benefits of IAM
* AWS IAM Best Practices
* Learning Roadmap
* Key Takeaways

---

# What is AWS IAM?

**AWS Identity and Access Management (IAM)** is a global AWS service that helps you securely manage access to AWS resources.

IAM allows you to:

* Create users and groups
* Assign permissions
* Control access to AWS services
* Secure AWS resources
* Implement the Principle of Least Privilege

Think of IAM as the **security gatekeeper** for your AWS account.

---

# Why Do We Need IAM?

Without IAM, everyone would have unrestricted access to every AWS resource, increasing the risk of accidental or malicious changes.

IAM helps organizations:

* Protect AWS resources
* Control who can access what
* Track user activities
* Enforce security policies
* Reduce security risks

---

# Real-World Example

Imagine a company office.

* Employees have ID cards.
* Security decides which rooms each employee can enter.
* Managers may access additional rooms.
* Visitors receive temporary access.

AWS IAM works in the same way.

| Office                  | AWS IAM                      |
| ----------------------- | ---------------------------- |
| Employee                | IAM User                     |
| Department              | IAM Group                    |
| Visitor Pass            | IAM Role                     |
| Security Rules          | IAM Policies                 |
| Company Security Policy | Service Control Policy (SCP) |

---

# Authentication vs Authorization

Authentication answers:

> **Who are you?**

Examples:

* Username & Password
* Access Keys
* Multi-Factor Authentication (MFA)

---

Authorization answers:

> **What are you allowed to do?**

Examples:

* Launch EC2
* Create S3 Bucket
* Delete IAM User

---

## Authentication Flow

```text
User

 │

 ▼

Login

 │

 ▼

AWS Verifies Identity

 │

 ▼

Authenticated
```

---

## Authorization Flow

```text
Authenticated User

        │

        ▼

IAM Policy Evaluation

        │

        ▼

Allow or Deny Request
```

---

# IAM Components

AWS IAM consists of several core components:

* IAM Users
* IAM Groups
* IAM Roles
* IAM Policies
* Permissions Boundaries
* Service Control Policies (SCP)
* Multi-Factor Authentication (MFA)

These components work together to control access securely.

---

# IAM Architecture

```text
                    AWS Account
                         │
              ┌──────────┴──────────┐
              │                     │
         IAM Identities        IAM Policies
              │                     │
      ┌───────┼────────┐            │
      │       │        │            │
   User     Group    Role           │
      │       │        │            │
      └───────┴────────┘            │
               │                    │
        Authentication              │
               │                    │
          Authorization─────────────┘
               │
               ▼
         AWS Resources
   EC2 • S3 • RDS • Lambda
```

---

# How IAM Works

When a user accesses AWS:

1. The user authenticates with AWS.
2. AWS verifies the identity.
3. IAM evaluates attached policies.
4. AWS checks any Permissions Boundaries.
5. AWS checks any Service Control Policies (SCPs).
6. AWS allows or denies the request.

---

## Permission Evaluation Flow

```text
User Request

      │

Authenticate

      │

IAM Policy

      │

Permissions Boundary

      │

Service Control Policy (SCP)

      │

AWS Decision

Allow ✔

or

Deny ✘
```

---

# Benefits of IAM

* Secure access management
* Fine-grained permissions
* Centralized user management
* Temporary credentials using Roles
* Multi-Factor Authentication (MFA)
* Audit access with CloudTrail
* Supports Least Privilege Access
* Cross-account access using Roles

---

# AWS IAM Best Practices

✅ Never use the Root User for daily tasks.

✅ Enable Multi-Factor Authentication (MFA).

✅ Follow the Principle of Least Privilege.

✅ Use IAM Roles instead of Access Keys whenever possible.

✅ Rotate Access Keys regularly.

✅ Use Groups to manage permissions.

✅ Monitor IAM activities using AWS CloudTrail.

✅ Review IAM permissions periodically.

---

# Learning Roadmap

This repository covers the following topics:

```
01. Introduction
        │
        ▼
02. IAM Users
        │
        ▼
03. IAM Groups
        │
        ▼
04. IAM Roles
        │
        ▼
05. IAM Policies
        │
        ▼
06. Permissions Boundaries
        │
        ▼
07. IAM User vs Group vs Role vs Boundary vs SCP
        │
        ▼
08. Service Control Policies (SCP)
        │
        ▼
09. IAM Best Practices
        │
        ▼
10. Hands-on Labs
        │
        ▼
11. Interview Questions
```

---

# Key Takeaways

* IAM is the identity and access management service for AWS.
* IAM controls who can access AWS resources.
* Authentication verifies identity.
* Authorization determines permissions.
* IAM follows the Principle of Least Privilege.
* IAM Users, Groups, Roles, Policies, Boundaries, and SCPs work together to secure AWS resources.

---

# What's Next?

➡️ Continue with **02-IAM-Users.md** to learn how to create and manage IAM Users, understand login credentials, access keys, and best practices.

---

## Author

**Newton Babu Nandru**

**Senior Linux & Production Support Engineer**

**AWS Cloud & DevOps Enthusiast**

⭐ If you found this guide helpful, consider starring this repository and following my AWS learning journey!

