
# 🛤️ Create an AWS CloudTrail Trail

## 📌 Lab Objective

The objective of this lab is to create an **AWS CloudTrail Trail** that continuously records AWS API activity and stores log files in an **Amazon S3 bucket** for long-term auditing, security monitoring, and compliance.

---

# 📖 What is a CloudTrail Trail?

A **Trail** is a CloudTrail configuration that continuously captures AWS API activity across your AWS account.

Unlike **Event History**, which stores only the last **90 days** of management events, a Trail delivers logs to an Amazon S3 bucket where they can be retained for months or years.

> **Key Point:** A Trail enables long-term storage and centralized logging of AWS account activity.

---

# 🎯 Why Create a Trail?

Creating a Trail allows you to:

- Store logs beyond 90 days
- Monitor AWS account activity continuously
- Meet compliance requirements
- Perform security investigations
- Analyze historical AWS API activity
- Integrate with Amazon Athena, CloudWatch, and AWS Security services

---

# 🏗️ CloudTrail Trail Architecture

```text
        User / Application
                │
                ▼
       AWS Console / CLI / SDK
                │
                ▼
          AWS API Request
                │
                ▼
         AWS CloudTrail Trail
                │
                ▼
         Amazon S3 Bucket
                │
                ▼
      CloudTrail Log Files (.json.gz)
```

---

# 🧪 Hands-on Lab

## Step 1: Open AWS CloudTrail

1. Sign in to the AWS Management Console.
2. Search for **CloudTrail**.
3. Open the CloudTrail service.
4. Select **Trails** from the left navigation pane.
5. Click **Create trail**.

---

## Step 2: Configure the Trail

Provide the following details:

| Setting | Value |
|----------|-------|
| Trail Name | MyCloudTrail |
| Apply Trail to | All Regions (Recommended) |
| Enable Log File Validation | Enabled |
| SNS Notification | Optional |

---

## Step 3: Configure Amazon S3

Choose where CloudTrail should store log files.

Options:

- Create a new S3 bucket
- Use an existing S3 bucket

Example:

```
Bucket Name

newtonnani-cloudtrail-logs
```

CloudTrail automatically creates the required folder structure inside the bucket.

---

## Step 4: Select Event Types

Choose which events CloudTrail should record.

### Management Events

Records actions performed on AWS resources.

Examples:

- Launch EC2 Instance
- Stop EC2 Instance
- Create IAM User
- Create Security Group

Recommended:
```
Read Events ✅

Write Events ✅
```

---

### Data Events (Optional)

Records object-level activity.

Examples:

- Upload object to Amazon S3
- Download object from Amazon S3
- Invoke Lambda Function

---

### Insights Events (Optional)

Detects unusual AWS API activity.

Examples:

- Sudden increase in API calls
- High API error rate

---

## Step 5: Create the Trail

Review all settings.

Click:

```
Create Trail
```

CloudTrail begins recording AWS API activity immediately.

---

# 📂 CloudTrail Log Storage

CloudTrail stores logs in Amazon S3 using the following folder structure.

```text
AWSLogs/
└── Account-ID/
    └── CloudTrail/
        └── us-east-1/
            └── 2026/
                └── 06/
                    └── 29/
                        └── LogFile.json.gz
```

---

# 🔍 Verify the Trail

After creating the Trail:

1. Open **CloudTrail → Trails**
2. Verify the Trail status is **Logging**
3. Open the configured Amazon S3 bucket
4. Confirm CloudTrail log files are being delivered

---

# 💼 Real-World Example

A company wants to retain AWS activity logs for one year to satisfy compliance requirements.

Instead of relying on the default 90-day Event History, they:

- Create a Multi-Region Trail
- Store logs in Amazon S3
- Enable Log File Validation
- Analyze logs using Amazon Athena

This provides secure, long-term audit records for security and compliance.

---

# 🎯 Benefits of Using a Trail

- Continuous AWS activity logging
- Long-term log retention
- Secure storage in Amazon S3
- Supports auditing and compliance
- Tracks activity across multiple AWS Regions
- Integrates with AWS analytics and security services

---

# 🔑 Best Practices

- Use a Multi-Region Trail.
- Enable Log File Validation.
- Encrypt logs using AWS KMS.
- Restrict access to the S3 bucket with IAM policies.
- Enable CloudTrail Insights for anomaly detection.
- Monitor log delivery regularly.

---

# 📚 Summary

AWS CloudTrail Trails provide continuous monitoring of AWS API activity and securely store logs in Amazon S3. They are essential for security auditing, compliance, operational troubleshooting, and long-term activity tracking. Creating a Trail is a best practice for every production AWS environment.


