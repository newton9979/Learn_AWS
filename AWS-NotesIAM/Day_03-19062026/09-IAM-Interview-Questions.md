# 09 - AWS IAM Interview Questions

> **AWS IAM Complete Guide**
> **Day 09 – IAM Interview Questions**

---

# 📚 Learning Objectives

After completing this chapter, you will be able to:

* Answer common AWS IAM interview questions.
* Understand IAM concepts with real-world examples.
* Prepare for AWS Cloud, DevOps, Linux, and Production Support interviews.
* Revise important IAM topics quickly before interviews.

---

# Beginner Level Questions

## 1. What is AWS IAM?

**Answer:**

AWS Identity and Access Management (IAM) is a service that helps you securely control access to AWS resources. It allows you to create users, groups, roles, and policies to manage permissions.

---

## 2. What are the main IAM components?

**Answer:**

* IAM Users
* IAM Groups
* IAM Roles
* IAM Policies
* Permission Boundaries
* Service Control Policies (SCP)

---

## 3. What is an IAM User?

**Answer:**

An IAM User represents an individual person or application that needs access to AWS resources.

Example:

* Alice
* Bob
* Jenkins Server

---

## 4. What is an IAM Group?

**Answer:**

An IAM Group is a collection of IAM users.

Permissions are assigned to the group, and all members inherit those permissions.

Example:

```text
Developers
├── Alice
├── Bob
└── Charlie
```

---

## 5. What is an IAM Role?

**Answer:**

An IAM Role is an identity that provides **temporary credentials** to trusted users or AWS services.

Example:

* EC2 accessing S3
* Lambda accessing DynamoDB
* Cross-account access

---

## 6. What is an IAM Policy?

**Answer:**

An IAM Policy is a JSON document that defines what actions are allowed or denied on AWS resources.

Example:

```json
{
  "Effect": "Allow",
  "Action": "s3:GetObject",
  "Resource": "*"
}
```

---

## 7. What is the Principle of Least Privilege?

**Answer:**

Users should receive only the permissions required to perform their job and nothing more.

---

## 8. Why should we avoid using the Root User?

**Answer:**

The Root User has full access to all AWS services.

It should only be used for account-level tasks such as:

* Billing
* Closing the account
* Support plan changes

---

## 9. What is Multi-Factor Authentication (MFA)?

**Answer:**

MFA requires users to provide:

* Password
* One-Time Password (OTP)

This provides an additional layer of security.

---

## 10. What is the difference between Authentication and Authorization?

| Authentication      | Authorization          |
| ------------------- | ---------------------- |
| Verifies identity   | Determines permissions |
| Login process       | Access control         |
| Username & Password | IAM Policies           |

---

# Intermediate Level Questions

## 11. What are AWS Managed Policies?

**Answer:**

Policies created and maintained by AWS.

Example:

* AmazonS3ReadOnlyAccess
* AmazonEC2FullAccess

---

## 12. What are Customer Managed Policies?

**Answer:**

Policies created and managed by customers to meet specific security requirements.

---

## 13. What are Inline Policies?

**Answer:**

Policies directly attached to a single IAM user, group, or role.

They cannot be shared with other IAM identities.

---

## 14. What is a Permission Boundary?

**Answer:**

A Permission Boundary sets the **maximum permissions** that an IAM user or role can receive.

It does not grant permissions by itself.

---

## 15. What is a Service Control Policy (SCP)?

**Answer:**

An SCP is an AWS Organizations policy that limits the maximum permissions available to AWS accounts.

It never grants permissions.

---

## 16. What is the difference between IAM Policy and SCP?

| IAM Policy                    | SCP                        |
| ----------------------------- | -------------------------- |
| Grants permissions            | Limits permissions         |
| Works on Users, Groups, Roles | Works on AWS Accounts      |
| Doesn't require Organizations | Requires AWS Organizations |

---

[O## 17. What happens if an IAM Policy allows an action but an SCP denies it?

**Answer:**

The request is denied because **explicit deny always overrides allow**.

---

## 18. Why are IAM Roles preferred over Access Keys?

**Answer:**

IAM Roles:

* Use temporary credentials.
* Eliminate long-term access keys.
* Rotate credentials automatically.
* Improve security.

---

## 19. What is the IAM Policy Evaluation Logic?

**Answer:**

AWS evaluates requests in this order:

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
SCP
      │
      ▼
Resource Policy
      │
      ▼
Final Decision
```

---

## 20. What is an Explicit Deny?

**Answer:**

An Explicit Deny always takes priority over any Allow statement.

Example:

* IAM Policy → Allow
* SCP → Deny

Result:

**Access Denied**

---

# Advanced Interview Questions

## 21. Explain Cross-Account Access.

**Answer:**

Cross-account access allows users or services in one AWS account to access resources in another AWS account using IAM Roles and Trust Policies.

---

## 22. What is a Trust Policy?

**Answer:**

A Trust Policy defines **who can assume an IAM Role**.

It specifies trusted principals such as AWS accounts, users, or services.

---

## 23. How do you secure IAM in Production?

**Answer:**

* Enable MFA.
* Avoid Root User.
* Follow Least Privilege.
* Use IAM Roles.
* Rotate Access Keys.
* Enable CloudTrail.
* Use Permission Boundaries.
* Use SCPs.
* Review IAM permissions regularly.

---

## 24. How do you audit IAM permissions?

**Answer:**

Use:

* IAM Access Analyzer
* IAM Credential Report
* CloudTrail
* AWS Config
* CloudWatch Logs

---

## 25. What are common IAM security mistakes?

**Answer:**

* Using Root User daily.
* Sharing IAM users.
* Hardcoding access keys.
* Giving AdministratorAccess to everyone.
* Not enabling MFA.
* Leaving inactive IAM users.
* Ignoring CloudTrail logs.

---

# Scenario-Based Questions

## Scenario 1

**Question:**

A developer needs to read objects from an S3 bucket but must not delete them.

**Answer:**

Assign the **AmazonS3ReadOnlyAccess** policy.

---

## Scenario 2

**Question:**

An EC2 instance needs access to an S3 bucket.

**Answer:**

Attach an IAM Role with the required S3 permissions to the EC2 instance.

---

## Scenario 3

**Question:**

Your company wants to prevent deletion of S3 buckets across all AWS accounts.

**Answer:**

Implement a **Service Control Policy (SCP)** that denies the `s3:DeleteBucket` action.

---

## Scenario 4

**Question:**

A user accidentally receives AdministratorAccess, but the organization wants to restrict IAM management.

**Answer:**

Apply a **Permission Boundary** or an **SCP** to limit IAM-related actions.

---

## Quick Revision Table

| Topic               | Key Point                            |
| ------------------- | ------------------------------------ |
| IAM User            | Represents a person or application   |
| IAM Group           | Collection of users                  |
| IAM Role            | Temporary credentials                |
| IAM Policy          | Grants permissions                   |
| Permission Boundary | Maximum permissions for users/roles  |
| SCP                 | Maximum permissions for AWS accounts |
| MFA                 | Additional security layer            |
| Least Privilege     | Grant only required permissions      |
| CloudTrail          | Records AWS API activity             |
| Explicit Deny       | Always overrides Allow               |

---

# Top 10 Interview Tips

* Understand IAM fundamentals before memorizing policies.
* Practice creating IAM Users, Groups, Roles, and Policies.
* Learn JSON policy syntax.
* Understand Policy Evaluation Logic.
* Know the difference between IAM Policies and SCPs.
* Explain real-world IAM scenarios confidently.
* Practice AWS Console and AWS CLI commands.
* Be familiar with IAM security best practices.
* Review AWS Well-Architected Security principles.
* Prepare examples from your own hands-on labs.

---

# Key Takeaways

* IAM is the foundation of AWS security.
* Policies define permissions.
* Roles provide temporary access.
* Permission Boundaries and SCPs enforce security limits.
* Explicit Deny overrides Allow.
* Least Privilege is a core AWS security principle.
* Hands-on practice is the best way to master IAM.

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
| ✅ Day 09 | IAM Interview Questions        | Completed |

---

## Next Chapter

➡️ **10-IAM-Hands-On-Lab.md**

---

### Author

**Newton Babu Nandru**
*Senior Linux & Production Support Engineer | AWS Cloud & DevOps Enthusiast*

