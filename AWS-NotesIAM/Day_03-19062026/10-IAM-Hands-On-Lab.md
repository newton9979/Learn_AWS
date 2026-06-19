# 10 - AWS IAM Hands-On Lab

> **AWS IAM Complete Guide**
> **Day 10 – Hands-on Lab Exercises**

---

# 🎯 Lab Objectives

By completing these labs, you will gain practical experience with:

* IAM Users
* IAM Groups
* IAM Roles
* IAM Policies
* Permission Boundaries
* Service Control Policies (SCP)
* Multi-Factor Authentication (MFA)
* AWS Organizations
* IAM Best Practices

---

# Lab Environment

### AWS Services Used

* AWS IAM
* AWS Organizations
* Amazon EC2
* Amazon S3
* AWS CloudTrail

---

# Lab 1 – Create an IAM User

## Objective

Create an IAM user with programmatic and console access.

### Steps

1. Open the AWS Console.
2. Navigate to **IAM → Users**.
3. Click **Create User**.
4. User Name: `dev-user`
5. Enable AWS Management Console access.
6. Set a custom password.
7. Finish the wizard.

### Expected Outcome

* IAM user created successfully.
* User can log in to the AWS Console.

---

# Lab 2 – Create an IAM Group

## Objective

Assign permissions through a group.

### Steps

1. Open **IAM → User Groups**.
2. Create a group named **Developers**.
3. Attach the **AmazonEC2ReadOnlyAccess** policy.
4. Add `dev-user` to the group.

### Expected Outcome

The user inherits EC2 read-only permissions from the group.

---

# Lab 3 – Create a Customer Managed Policy

## Objective

Create a custom S3 read-only policy.

### Steps

1. Navigate to **IAM → Policies**.
2. Click **Create Policy**.
3. Use the JSON editor.
4. Allow only `s3:GetObject`.
5. Save the policy as **Custom-S3-ReadOnly**.

### Expected Outcome

A reusable customer-managed policy is created.

---

# Lab 4 – Attach a Policy to a User

## Objective

Provide S3 read-only access.

### Steps

1. Open the `dev-user`.
2. Select **Add Permissions**.
3. Attach **Custom-S3-ReadOnly**.

### Expected Outcome

The user can view and download S3 objects but cannot delete them.

---

# Lab 5 – Create an IAM Role for EC2

## Objective

Allow an EC2 instance to access Amazon S3 securely.

### Steps

1. Navigate to **IAM → Roles**.
2. Create a role for **EC2**.
3. Attach **AmazonS3ReadOnlyAccess**.
4. Name the role **EC2-S3-Role**.

### Expected Outcome

EC2 instances using this role can access S3 without access keys.

---

# Lab 6 – Attach the IAM Role to an EC2 Instance

## Objective

Grant S3 access to a running EC2 instance.

### Steps

1. Open the EC2 Console.
2. Select an instance.
3. Choose **Actions → Security → Modify IAM Role**.
4. Attach **EC2-S3-Role**.

### Expected Outcome

The EC2 instance receives temporary AWS credentials automatically.

---

# Lab 7 – Test Access Using AWS CLI

## Objective

Verify IAM role permissions.

### Command

```bash
aws s3 ls
```

### Expected Outcome

The EC2 instance lists available S3 buckets.

---

# Lab 8 – Create a Permission Boundary

## Objective

Restrict the maximum permissions for IAM users.

### Steps

1. Create a policy that allows only EC2 actions.
2. Save it as **Developer-Boundary**.
3. Assign it as a Permission Boundary to `dev-user`.

### Expected Outcome

The user cannot exceed the permissions defined by the boundary.

---

# Lab 9 – Enable MFA

## Objective

Secure IAM user login.

### Steps

1. Open **IAM → Users → Security Credentials**.
2. Assign a virtual MFA device.
3. Scan the QR code using an authenticator app.
4. Verify two generated codes.

### Expected Outcome

The user must enter an MFA code during login.

---

# Lab 10 – Create an AWS Organization

## Objective

Manage multiple AWS accounts centrally.

### Steps

1. Open **AWS Organizations**.
2. Create an organization.
3. Create two Organizational Units:

   * Production
   * Development

### Expected Outcome

A multi-account organization is created.

---

# Lab 11 – Create a Service Control Policy (SCP)

## Objective

Prevent deletion of S3 buckets.

### Steps

1. Navigate to **AWS Organizations → Policies**.
2. Create an SCP.
3. Deny the `s3:DeleteBucket` action.
4. Attach it to the Development OU.

### Expected Outcome

Users in the Development OU cannot delete S3 buckets.

---

# Lab 12 – Enable CloudTrail

## Objective

Audit AWS API activity.

### Steps

1. Open **CloudTrail**.
2. Create a trail.
3. Enable logging for all regions.
4. Store logs in an S3 bucket.

### Expected Outcome

All AWS API calls are recorded.

---

# Lab 13 – Review IAM Access

## Objective

Identify unused or excessive permissions.

### Steps

1. Open **IAM Access Analyzer**.
2. Review IAM users and roles.
3. Remove unnecessary permissions.

### Expected Outcome

IAM permissions follow the Principle of Least Privilege.

---

# Lab 14 – Rotate Access Keys

## Objective

Improve account security.

### Steps

1. Open **IAM → Users → Security Credentials**.
2. Create a new access key.
3. Update applications with the new key.
4. Delete the old key.

### Expected Outcome

Long-term credentials are rotated successfully.

---

# Lab 15 – Final IAM Security Review

## Checklist

| Task                          | Status |
| ----------------------------- | ------ |
| Root User Protected           | ⬜      |
| MFA Enabled                   | ⬜      |
| IAM Groups Configured         | ⬜      |
| IAM Roles Created             | ⬜      |
| Policies Reviewed             | ⬜      |
| Permission Boundaries Applied | ⬜      |
| SCP Implemented               | ⬜      |
| CloudTrail Enabled            | ⬜      |
| Access Keys Rotated           | ⬜      |
| Least Privilege Applied       | ⬜      |

---

# Mini Project

## Scenario

Your company is launching a new application.

### Requirements

* Create three IAM users:

  * `developer1`
  * `developer2`
  * `admin1`
* Create two IAM groups:

  * Developers
  * Administrators
* Assign the appropriate AWS managed policies.
* Create an EC2 IAM role with S3 read-only access.
* Enable MFA for all users.
* Apply a Permission Boundary to developers.
* Create an SCP to block S3 bucket deletion.
* Enable CloudTrail for auditing.

### Deliverables

* Screenshots of each completed task.
* IAM policy JSON files.
* SCP JSON file.
* CloudTrail verification.
* GitHub documentation (`README.md`).

---

# Skills You Will Gain

* AWS Identity and Access Management (IAM)
* AWS Organizations
* IAM Policies
* IAM Roles
* Permission Boundaries
* Service Control Policies (SCP)
* IAM Security Best Practices
* AWS CloudTrail
* Least Privilege Access
* AWS Console and AWS CLI

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
| ✅ Day 10 | IAM Hands-on Lab               | Completed |

---

## Next Chapter

➡️ **11-IAM-Cheat-Sheet.md**

---

### Author

**Newton Babu Nandru**
*Senior Linux & Production Support Engineer | AWS Cloud & DevOps Enthusiast*

> ⭐ **Congratulations!** After completing these 15 labs, you will have hands-on experience with the core IAM concepts required for AWS Cloud, DevOps, and Production Support roles.

