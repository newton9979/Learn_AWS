# AWS IAM Groups

> **Day 03 – AWS IAM Complete Guide**
> **Author:** Newton Babu Nandru

---

# What is an IAM Group?

An **IAM Group** is a collection of IAM users.

Instead of assigning permissions to each user individually, you assign permissions to a **group**, and every user in that group automatically receives those permissions.

> **Key Point:** IAM Groups **cannot** be used to log in. Only IAM Users can log in.

---

# Why Use IAM Groups?

Imagine your company has 100 developers.

❌ Without Groups:

* Assign the same permissions to 100 users individually.

✅ With Groups:

* Create one **Developers** group.
* Attach the required policy once.
* Add all developers to the group.

This saves time and reduces management effort.

---

# Real-World Example

Company Structure

```
Company
│
├── Developers Group
│      ├── John
│      ├── Alice
│      └── Bob
│
├── Admin Group
│      ├── Newton
│      └── David
│
└── Finance Group
       ├── Sarah
       └── Kevin
```

Each group has different permissions.

---

# How IAM Groups Work

```
           IAM Policy
                │
                ▼
        +----------------+
        | Developers     |
        +----------------+
          │     │      │
          ▼     ▼      ▼
       User1  User2  User3
```

The policy is attached only once to the group.

---

# Characteristics of IAM Groups

* Collection of IAM Users
* Cannot contain another group
* Cannot be used to log in
* Can have multiple policies
* One user can belong to multiple groups
* Simplifies permission management

---

# Common IAM Groups

| Group      | Permissions                  |
| ---------- | ---------------------------- |
| Developers | EC2, CloudWatch              |
| Admins     | AdministratorAccess          |
| Finance    | Billing Access               |
| Security   | IAM Read Only                |
| DevOps     | EC2, S3, VPC, CloudFormation |

---

# How to Create an IAM Group

1. Open AWS Console.
2. Go to IAM.
3. Select **User Groups**.
4. Click **Create Group**.
5. Enter a group name.
6. Attach the required IAM policy.
7. Add users.
8. Click **Create Group**.

---

# Hands-On Lab

## Objective

Create a Developers group with EC2 read-only access.

### Step 1

Create an IAM Group

```
Developers
```

### Step 2

Attach AWS Managed Policy

```
AmazonEC2ReadOnlyAccess
```

### Step 3

Create IAM Users

```
dev1
dev2
```

### Step 4

Add both users to the Developers group.

### Step 5

Login as dev1.

Verify:

✅ View EC2 instances

❌ Cannot launch EC2

❌ Cannot terminate EC2

---

# AWS CLI Commands

Create Group

```bash
aws iam create-group --group-name Developers
```

Add User

```bash
aws iam add-user-to-group \
--group-name Developers \
--user-name dev1
```

List Groups

```bash
aws iam list-groups
```

List Users in Group

```bash
aws iam get-group --group-name Developers
```

Delete Group

```bash
aws iam delete-group --group-name Developers
```

---

# Best Practices

* Use groups instead of assigning permissions to each user.
* Follow the Principle of Least Privilege.
* Use AWS Managed Policies when possible.
* Remove inactive users from groups.
* Review group memberships regularly.
* Never share IAM user credentials.

---

# IAM Groups vs IAM Users

| IAM User               | IAM Group           |
| ---------------------- | ------------------- |
| Individual identity    | Collection of users |
| Can log in             | Cannot log in       |
| Own credentials        | No credentials      |
| Individual permissions | Shared permissions  |

---

# Interview Questions

### What is an IAM Group?

A collection of IAM users that share the same permissions.

---

### Can an IAM Group contain another IAM Group?

No.

---

### Can IAM Groups log in?

No.

---

### Can a user belong to multiple groups?

Yes.

---

### Why use IAM Groups?

To simplify permission management and avoid assigning permissions individually.

---

# Key Takeaways

* IAM Groups manage permissions for multiple users.
* Policies are attached to groups, not each user.
* Users inherit permissions from their groups.
* Groups reduce administrative overhead.
* Groups support secure and scalable access management.

---

# Summary

IAM Groups are designed to simplify permission management by allowing administrators to assign permissions to multiple users at once. Instead of managing permissions for each user individually, you manage permissions at the group level, making AWS environments easier to secure and maintain.

---

**Author:** Newton Babu Nandru
**Project:** AWS-IAM-Complete-Guide
**Day:** 03 – IAM Groups

