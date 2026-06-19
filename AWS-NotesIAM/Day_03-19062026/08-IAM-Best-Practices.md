# 08 - IAM Best Practices

> **AWS IAM Complete Guide**
> **Day 08 – IAM Best Practices**

---

# 📚 Learning Objectives

After completing this chapter, you will learn:

* Why IAM Best Practices are important
* AWS security recommendations
* How to secure IAM users and roles
* Common mistakes to avoid
* Real-world security scenarios
* Hands-on tasks
* Interview questions

---

# What are IAM Best Practices?

IAM Best Practices are AWS-recommended guidelines for creating a **secure, scalable, and manageable AWS environment**.

Following these practices helps protect your AWS account from unauthorized access and security threats.

---

# Why Are IAM Best Practices Important?

Without proper IAM configuration, attackers may:

* Gain unauthorized access to AWS resources.
* Delete critical production data.
* Launch expensive resources.
* Steal sensitive information.
* Compromise your AWS account.

Implementing IAM best practices minimizes these risks.

---

# AWS IAM Best Practices

## 1. Never Use the Root User for Daily Tasks

The **Root User** has unrestricted access to every AWS service.

### Recommendation

* Use the Root User only for account-level tasks.
* Create an IAM Administrator User for daily administration.

### Root User Tasks

* Change payment methods.
* Close AWS account.
* Enable IAM access to billing.
* Configure support plans.

---

## 2. Enable Multi-Factor Authentication (MFA)

MFA adds an extra layer of security by requiring:

* Password
* Authentication code

### Supported MFA Devices

* Google Authenticator
* Microsoft Authenticator
* Authy
* Hardware MFA Device

### Benefits

* Protects against password theft.
* Prevents unauthorized logins.

---

## 3. Follow the Principle of Least Privilege

Grant users **only the permissions they need** to perform their job.

### Example

❌ AdministratorAccess for every user

✅ EC2 ReadOnly Access for Developers

---

## 4. Use IAM Groups

Instead of assigning permissions individually:

```text
Developers Group
│
├── Alice
├── Bob
└── Charlie
```

Attach the policy to the **Group**, not each user.

### Benefits

* Easier management.
* Consistent permissions.
* Reduced administrative effort.

---

## 5. Use IAM Roles Instead of Access Keys

For AWS services:

❌ Store Access Keys on EC2

✅ Attach an IAM Role to the EC2 instance

### Example

```text
EC2 Instance
      │
      ▼
IAM Role
      │
      ▼
AmazonS3ReadOnlyAccess
```

Benefits:

* Temporary credentials.
* Automatic credential rotation.
* Improved security.

---

## 6. Rotate Access Keys Regularly

Long-lived access keys increase security risk.

### Recommendation

* Rotate keys every 90 days.
* Delete unused keys immediately.

---

## 7. Use Strong Password Policies

Configure IAM password policies to enforce:

* Minimum 12 characters.
* Uppercase letters.
* Lowercase letters.
* Numbers.
* Special characters.
* Password expiration.

---

## 8. Remove Unused IAM Users

Regularly review IAM users.

Delete:

* Inactive users.
* Former employees.
* Temporary accounts.

---

## 9. Enable CloudTrail

CloudTrail records every AWS API call.

### Benefits

* Security auditing.
* Compliance.
* Troubleshooting.
* Incident investigation.

---

## 10. Use Permission Boundaries

Permission Boundaries prevent users from exceeding predefined permission limits.

Example:

Developer can create IAM users but cannot assign AdministratorAccess.

---

## 11. Use Service Control Policies (SCP)

For organizations with multiple AWS accounts:

Use SCPs to:

* Prevent deleting S3 buckets.
* Block disabling CloudTrail.
* Restrict specific AWS Regions.
* Prevent IAM privilege escalation.

---

## 12. Review IAM Permissions Regularly

Perform periodic audits to:

* Remove unused permissions.
* Apply least privilege.
* Detect excessive access.

---

# Common Mistakes

❌ Using Root User every day

❌ Sharing IAM accounts

❌ Hardcoding Access Keys in source code

❌ Using AdministratorAccess for all users

❌ Ignoring MFA

❌ Never rotating Access Keys

❌ Leaving inactive IAM users

❌ Not monitoring CloudTrail logs

---

# Real-World Example

Company Structure

```text
ABC Company

Developers
│
├── Alice
├── Bob

Production
│
└── EC2 Servers
```

Best Practices Applied:

* Developers use IAM Users.
* Developers belong to IAM Groups.
* EC2 instances use IAM Roles.
* MFA enabled for all users.
* CloudTrail enabled.
* SCP protects Production accounts.
* Permission Boundaries prevent privilege escalation.

---

# Hands-on Lab

## Task 1

Enable MFA for the Root User.

---

## Task 2

Create an IAM Admin User.

---

## Task 3

Create an IAM Group named **Developers**.

---

## Task 4

Attach **AmazonEC2ReadOnlyAccess** to the Developers group.

---

## Task 5

Create an EC2 IAM Role with **AmazonS3ReadOnlyAccess**.

---

## Task 6

Enable CloudTrail.

---

## Task 7

Create a strong IAM password policy.

---

## Task 8

Review IAM users and delete unused accounts.

---

# Best Practices Checklist

| Practice                         | Status |
| -------------------------------- | ------ |
| Root User Protected              | ✅      |
| MFA Enabled                      | ✅      |
| Least Privilege                  | ✅      |
| IAM Groups Used                  | ✅      |
| IAM Roles Used                   | ✅      |
| Access Keys Rotated              | ✅      |
| Password Policy Enabled          | ✅      |
| CloudTrail Enabled               | ✅      |
| Permission Boundaries Configured | ✅      |
| SCP Implemented                  | ✅      |

---

# Interview Questions

### 1. What is the Principle of Least Privilege?

Grant users only the permissions required to perform their job.

---

### 2. Why should IAM Roles be used instead of Access Keys?

IAM Roles provide temporary credentials, improve security, and eliminate the need to store long-term access keys.

---

### 3. Why should the Root User not be used daily?

The Root User has unrestricted access, making it a high-risk account if compromised.

---

### 4. What is MFA?

Multi-Factor Authentication requires both a password and a second verification factor, improving account security.

---

### 5. Why should CloudTrail be enabled?

CloudTrail records AWS API activity for auditing, monitoring, compliance, and troubleshooting.

---

# Key Takeaways

* Protect the Root User.
* Enable MFA for all users.
* Follow the Principle of Least Privilege.
* Use IAM Groups for permission management.
* Prefer IAM Roles over Access Keys.
* Rotate Access Keys regularly.
* Enable CloudTrail.
* Use Permission Boundaries and SCPs.
* Regularly review IAM permissions.

---

# Repository Progress

| Day      | Topic                          | Status    |
| -------- | ------------------------------ | --------- |
| ✅ Day 01 | Introduction                   | Completed |
| ✅ Day 02 | IAM Users                      | Completed |
| ✅ Day 03 | IAM Groups                     | Completed |
| ✅ Day 04 | IAM Roles                      | Completed |
| ✅ Day 05 | IAM Policies                   | Completed |
| ✅ Day 06 | Permission Boundaries          | Completed |
| ✅ Day 07 | Service Control Policies (SCP) | Completed |
| ✅ Day 08 | IAM Best Practices             | Completed |

---

## Next Chapter

➡️ **09-IAM-Interview-Questions.md**

---

### Author

**Newton Babu Nandru**
*AWS Cloud & DevOps Enthusiast*

