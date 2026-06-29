# 🛠️ AWS CloudTrail Troubleshooting Guide

## 📌 Lab Objective

The objective of this guide is to troubleshoot common AWS CloudTrail issues. You will learn how to identify problems, understand their causes, and apply the appropriate solutions to ensure CloudTrail operates correctly.

---

# 📖 Introduction

AWS CloudTrail records AWS API activity for auditing, monitoring, and compliance. However, you may occasionally encounter issues such as missing logs, log delivery failures, permission errors, or missing events.

This guide covers the most common CloudTrail problems and how to resolve them.

---

# 🔍 Troubleshooting Workflow

```text
              CloudTrail Issue
                     │
        ┌────────────┴────────────┐
        ▼                         ▼
   Identify Problem         Check Configuration
        │                         │
        ▼                         ▼
 Review Trail Status      Verify S3 / IAM / KMS
        │                         │
        └────────────┬────────────┘
                     ▼
              Apply Solution
                     │
                     ▼
              Verify Log Delivery
```

---

# 🚨 Issue 1: No Events in Event History

### Symptoms

- Event History is empty.
- Recent AWS actions are not displayed.

### Possible Causes

- Incorrect AWS Region selected.
- No management events performed.
- Event filters applied.

### Solution

- Verify the correct AWS Region.
- Clear all filters.
- Perform a test action (for example, launch or stop an EC2 instance).
- Refresh the Event History page.

---

# 🚨 Issue 2: CloudTrail Logs Not Delivered to Amazon S3

### Symptoms

- S3 bucket is empty.
- No CloudTrail log files appear.

### Possible Causes

- Incorrect S3 bucket policy.
- Invalid bucket name.
- Trail logging disabled.

### Solution

- Verify the S3 bucket exists.
- Check the bucket policy.
- Confirm the Trail status is **Logging**.
- Wait a few minutes for log delivery.

---

# 🚨 Issue 3: Trail Status is Not Logging

### Symptoms

- Trail shows **Logging Off**.

### Possible Causes

- Trail stopped manually.
- Configuration changes.
- IAM permission issues.

### Solution

1. Open **CloudTrail → Trails**.
2. Select your Trail.
3. Verify that logging is enabled.
4. Restart logging if required.

---

# 🚨 Issue 4: Access Denied Error

### Symptoms

```text
AccessDenied
```

### Possible Causes

- Missing IAM permissions.
- Incorrect bucket policy.
- Missing KMS permissions.

### Solution

Ensure the IAM user or role has permissions such as:

- cloudtrail:CreateTrail
- cloudtrail:StartLogging
- s3:PutObject
- s3:GetBucketAcl

---

# 🚨 Issue 5: Missing Data Events

### Symptoms

- S3 object uploads are not recorded.
- Lambda invocations are missing.

### Possible Causes

- Data Events are disabled.

### Solution

1. Open your Trail.
2. Click **Edit**.
3. Enable **Data Events**.
4. Select the required resources (S3, Lambda, DynamoDB).
5. Save the configuration.

---

# 🚨 Issue 6: CloudTrail Insights Not Generating Events

### Symptoms

- No Insight Events are displayed.

### Possible Causes

- Insights not enabled.
- No unusual API activity.

### Solution

- Enable **CloudTrail Insights** on the Trail.
- Generate API activity by creating or modifying AWS resources.
- Allow CloudTrail time to analyze activity patterns.

---

# 🚨 Issue 7: Log File Validation Failed

### Symptoms

- Log integrity verification fails.

### Possible Causes

- Log files modified after delivery.
- Missing digest files.

### Solution

- Verify logs were not altered.
- Ensure digest files exist in the S3 bucket.
- Re-enable Log File Validation if necessary.

---

# 🚨 Issue 8: Trail Exists but No Recent Logs

### Symptoms

- Older logs are available.
- New activity is missing.

### Possible Causes

- Logging stopped.
- Incorrect Region.
- Service delay.

### Solution

- Confirm the Trail is logging.
- Check the correct AWS Region.
- Perform a new AWS action.
- Wait a few minutes and refresh the S3 bucket.

---

# 🔍 Troubleshooting Checklist

| Check | Status |
|-------|:------:|
| Correct AWS Region | ✅ |
| Trail Logging Enabled | ✅ |
| S3 Bucket Exists | ✅ |
| Bucket Policy Correct | ✅ |
| IAM Permissions Configured | ✅ |
| Data Events Enabled (if required) | ✅ |
| CloudTrail Insights Enabled | ✅ |
| Log File Validation Enabled | ✅ |

---

# 💼 Real-World Example

A company notices that uploads to an Amazon S3 bucket are not appearing in CloudTrail logs.

### Investigation

- Event History shows only Management Events.
- Data Events are disabled.

### Resolution

- Enable **Data Events** for the S3 bucket.
- Save the Trail configuration.
- Upload a new file.
- Verify that a **PutObject** event appears in CloudTrail.

---

# 🎯 Troubleshooting Tips

- Use **Event History** for recent activity.
- Verify the Trail status regularly.
- Check Amazon S3 for log delivery.
- Review IAM permissions before making changes.
- Test CloudTrail by creating or modifying AWS resources.
- Use CloudTrail Insights to detect unusual activity.

---

# 📚 Summary

Most AWS CloudTrail issues are caused by incorrect Trail configuration, missing IAM permissions, S3 bucket policy problems, disabled Data Events, or selecting the wrong AWS Region. Following a structured troubleshooting process helps quickly identify and resolve these issues, ensuring reliable audit logging and monitoring across your AWS environment.

---

# 🎯 Key Takeaways

- Always verify the correct AWS Region.
- Ensure the Trail status is **Logging**.
- Confirm logs are delivered to Amazon S3.
- Enable Data Events when object-level logging is required.
- Enable CloudTrail Insights for anomaly detection.
- Check IAM, S3, and KMS permissions when troubleshooting access issues.


