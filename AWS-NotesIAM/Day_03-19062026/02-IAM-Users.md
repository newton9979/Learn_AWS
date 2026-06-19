# 👤 AWS IAM Users

> **Day 03 – AWS Identity and Access Management (IAM)**
> **Topic:** IAM Users
> **Author:** Newton Babu Nandru

---

# 📖 What is an IAM User?

An **IAM User** is a digital identity in AWS that represents a **person or an application** that needs permission to access AWS resources.

Each IAM user has its own:

* Username
* Password (for AWS Console login)
* Access Keys (for AWS CLI/SDK access)
* Permissions
* MFA (Optional but Recommended)

> Think of an IAM User as an employee ID card inside your organization.

---

# 🎯 Why Do We Need IAM Users?

Without IAM Users:

* Everyone would use the Root Account ❌
* Difficult to track activities
* High security risk

With IAM Users:

* Individual identities
* Secure access
* Easy auditing
* Permission management
* MFA support

---

# 🏢 Real-World Example

Imagine your company has three employees:

| Employee | Department | AWS Access          |
| -------- | ---------- | ------------------- |
| Alice    | Developer  | EC2 & S3            |
| Bob      | Tester     | Read-only           |
| Charlie  | DevOps     | Full Infrastructure |

Instead of sharing one AWS account, each employee receives an individual IAM User.

```
AWS Account
│
├── Alice
├── Bob
└── Charlie
```

Each user has different permissions.

---

# 🏗 IAM User Architecture

```
                    AWS Account
                         │
        ┌────────────────┼────────────────┐
        │                │                │
     IAM User         IAM User        IAM User
      Alice             Bob           Charlie
        │                │                │
   AmazonEC2Full    ReadOnly      Administrator
```

---

# 🔑 Authentication Methods

IAM Users can authenticate using:

### 1. AWS Management Console

```
Username
Password
MFA (Optional)
```

Used for:

* Web Browser Login
* AWS Console

---

### 2. Access Keys

```
Access Key ID

Secret Access Key
```

Used for:

* AWS CLI
* SDK
* Terraform
* Automation Scripts

Example:

```bash
aws configure

AWS Access Key ID:
AWS Secret Access Key:
Region:
Output Format:
```

---

# 📝 How to Create an IAM User

## Step 1

Login as Root User.

```
AWS Console
    ↓
IAM
```

---

## Step 2

Choose

```
Users
```

---

## Step 3

Click

```
Create User
```

---

## Step 4

Enter

```
Username

DevOps-Engineer
```

---

## Step 5

Choose Access Type

✅ AWS Management Console

OR

✅ Programmatic Access

---

## Step 6

Assign Permissions

Example:

```
AmazonEC2ReadOnlyAccess
```

---

## Step 7

Review

Create User

Done ✅

---

# 🛠 AWS CLI Example

Create User

```bash
aws iam create-user \
--user-name DevOps-Engineer
```

Attach Policy

```bash
aws iam attach-user-policy \
--user-name DevOps-Engineer \
--policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess
```

List Users

```bash
aws iam list-users
```

Delete User

```bash
aws iam delete-user \
--user-name DevOps-Engineer
```

---

# 📊 IAM User Workflow

```
Developer
      │
      ▼
 IAM User
      │
      ▼
 IAM Policy
      │
      ▼
 AWS Services
      │
 ┌────┼─────────┐
 │    │         │
EC2   S3      CloudWatch
```

---

# 🔐 Security Best Practices

✅ Never use Root Account daily.

✅ Enable MFA.

✅ Rotate Access Keys.

✅ Delete unused users.

✅ Apply Least Privilege.

✅ Use IAM Groups for permission management.

✅ Monitor activity using CloudTrail.

---

# ❌ Common Mistakes

❌ Sharing one IAM User among multiple employees

❌ Using AdministratorAccess for everyone

❌ Hardcoding Access Keys in source code

❌ Not enabling MFA

❌ Using Root Account for daily tasks

---

# 🎯 Hands-On Practice Tasks

## Task 1

Create an IAM User

Name:

```
developer1
```

Attach

```
AmazonEC2ReadOnlyAccess
```

Verify:

* Can view EC2
* Cannot launch instances

---

## Task 2

Create another user

```
tester1
```

Attach

```
AmazonS3ReadOnlyAccess
```

Verify:

* Can list S3 buckets
* Cannot upload objects

---

## Task 3

Enable MFA

Verify:

* Login requires MFA code

---

## Task 4

Generate Access Keys

Configure AWS CLI

```bash
aws configure
```

Run

```bash
aws s3 ls
```

---

## Task 5

Delete Access Keys

Create new keys

Update CLI

---

# 🧠 Interview Questions

### What is an IAM User?

An IAM User is an identity created inside an AWS account for a person or application that requires access to AWS resources.

---

### Can an IAM User have multiple policies?

Yes.

A user can have:

* Managed Policies
* Inline Policies

---

### Can IAM Users belong to multiple groups?

Yes.

One user can be a member of multiple IAM Groups.

---

### Does an IAM User have a password?

Yes.

If Console access is enabled.

---

### Does an IAM User have Access Keys?

Yes.

For AWS CLI and SDK access.

---

### Can we create IAM Users using CLI?

Yes.

```bash
aws iam create-user
```

---

# 📌 Key Takeaways

* IAM Users represent people or applications.
* Each user has unique credentials.
* Use IAM Policies to control permissions.
* Enable MFA for security.
* Follow the Principle of Least Privilege.
* Avoid using the Root Account for daily operations.
* IAM Users can access AWS through the Console or AWS CLI.

---

# 📚 Next Topic

➡️ **03-IAM-Groups.md**

Learn how IAM Groups simplify permission management for multiple users.

---

⭐ If this guide helped you, consider giving the repository a **Star** and following the learning series.

**Author:** Newton Babu Nandru

