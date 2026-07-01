# Amazon S3 Advanced Features — Complete Guide

## Introduction

Amazon S3 is much more than an object storage service. It provides a rich set of features that help developers build scalable, secure, highly available, and cost-effective cloud applications.

These advanced features enable Amazon S3 to integrate seamlessly with other AWS services, automate workflows, improve performance, and protect critical business data.

In this guide, you'll explore the most important Amazon S3 features used in real-world production environments — from static website hosting and event-driven automation through replication, multipart upload, transfer acceleration, object lock, access points, batch operations, and storage analytics.

---

## Static Website Hosting

One of Amazon S3's most popular features is **Static Website Hosting**.

It allows you to host static websites directly from an S3 bucket without managing web servers.

A static website contains files such as:

- HTML
- CSS
- JavaScript
- Images
- Fonts
- Videos

Since these files don't require server-side processing, Amazon S3 can serve them directly to users.

### How Static Website Hosting Works

When Static Website Hosting is enabled, Amazon S3 acts as a web server.

```
User Browser
        │
        ▼
Amazon S3 Website Endpoint
        │
        ▼
HTML
CSS
JavaScript
Images
```

The browser requests the website, and Amazon S3 returns the requested static files.

### Website Endpoint

After enabling Static Website Hosting, Amazon S3 provides a website endpoint.

Example:

```
http://my-website.s3-website-us-east-1.amazonaws.com
```

This endpoint is used to access the hosted website through a web browser.

### Required Website Documents

To host a website, Amazon S3 requires at least one document.

**Index Document** — Usually `index.html`. This is the default page loaded when visitors open the website.

**Error Document** — Usually `error.html`. This page is displayed when a requested resource cannot be found (e.g. a "404 Page Not Found" page).

### Bucket Configuration

To host a website successfully:

- Create an S3 bucket.
- Upload website files.
- Enable Static Website Hosting.
- Specify an Index Document and an Error Document.
- Configure Bucket Policy to allow public read access (only for public websites).
- Disable Block Public Access if public access is required.

### Static Website Hosting Architecture

```
                 Internet
                     │
                     ▼
              User Browser
                     │
                     ▼
        Amazon S3 Website Endpoint
                     │
      ┌──────────────┼──────────────┐
      │              │              │
      ▼              ▼              ▼
   index.html      style.css     logo.png
```

Amazon S3 automatically serves the requested files to users.

### Real-World Example: Product Landing Page

A company wants to host its product landing page.

Website files:

```
index.html
style.css
app.js
images/
logo.png
```

Workflow:

```
Developer
↓
Upload Files
↓
Amazon S3 Bucket
↓
Enable Website Hosting
↓
Users Access Website
```

No EC2 instance or web server is required.

### Advantages of Static Website Hosting

**Low Cost** — You only pay for storage and requests.

**High Availability** — Amazon S3 is designed for high durability and availability.

**Easy Deployment** — Simply upload updated website files.

**Scalability** — Amazon S3 automatically handles increased traffic without manual scaling.

**Integration** — Can be combined with Amazon CloudFront, AWS Certificate Manager (ACM), Amazon Route 53, and AWS WAF to build secure and globally distributed websites.

### Common Use Cases

Amazon S3 Static Website Hosting is commonly used for:

- Portfolio Websites
- Company Landing Pages
- Documentation Sites
- Product Catalogs
- Single Page Applications (SPA)
- Blog Websites
- Resume Websites

### Limitations

Amazon S3 Static Website Hosting supports only static content.

It does **not** support PHP, Python, Java, Node.js, server-side databases, or dynamic APIs.

For dynamic applications, services such as Amazon EC2, AWS Elastic Beanstalk, Amazon ECS, or AWS Lambda should be used.

### Best Practices (Static Website Hosting)

- Enable Versioning for website files.
- Use CloudFront for faster global delivery.
- Enable HTTPS using CloudFront and ACM.
- Store sensitive files in private buckets.
- Monitor access using AWS CloudTrail.
- Enable server-side encryption for stored objects.

---

## S3 Event Notifications & Replication

Amazon S3 is not just a storage service — it can also trigger automated workflows whenever objects are created, deleted, or restored.

Using **S3 Event Notifications**, applications can respond automatically to changes in a bucket without requiring manual intervention.

Amazon S3 also provides **Replication**, allowing objects to be copied automatically to another bucket for backup, disaster recovery, or compliance purposes.

### What are S3 Event Notifications?

S3 Event Notifications allow Amazon S3 to send notifications whenever specific events occur in a bucket.

Common events include:

- Object Created
- Object Deleted
- Object Restored
- Object Tagging Updated
- Replication Completed

Example:

```
User Uploads Image
↓
Amazon S3
↓
Event Triggered
↓
Notification Sent
```

Applications can immediately process uploaded files without continuously checking the bucket.

### Supported Event Destinations

Amazon S3 can send notifications to several AWS services.

**Amazon SNS (Simple Notification Service)** — Used to notify multiple subscribers.

```
S3 Bucket
↓
SNS Topic
↓
Email
SMS
Applications
```

Example use cases: email alerts, system notifications, team notifications.

**Amazon SQS (Simple Queue Service)** — Used to process events asynchronously.

```
S3 Bucket
↓
SQS Queue
↓
Application
↓
Process Object
```

Benefits: reliable message delivery, decoupled applications, handles traffic spikes.

**AWS Lambda** — Automatically executes code when an event occurs.

```
Image Uploaded
↓
Amazon S3
↓
Lambda Function
↓
Resize Image
↓
Save Thumbnail
```

Common use cases: image resizing, video processing, virus scanning, metadata extraction, file validation.

### Event Notification Workflow

```
User Uploads File
↓
Amazon S3
↓
Event Notification
↓
SNS / SQS / Lambda
↓
Automated Processing
```

No manual intervention is required.

### Real-World Example: Profile Picture Uploads

A company allows customers to upload profile pictures.

```
Customer
↓
Upload Image
↓
Amazon S3
↓
Lambda Triggered
↓
Resize Image
↓
Store Thumbnail
↓
Application Displays Image
```

This automation improves performance and reduces manual work.

### What is Amazon S3 Replication?

Replication automatically copies objects from one S3 bucket to another.

Benefits: Disaster Recovery, Backup, Compliance, Multi-Region Availability, Data Redundancy.

Replication occurs automatically after objects are uploaded.

### Types of Replication

Amazon S3 supports two replication methods:

- Same-Region Replication (SRR)
- Cross-Region Replication (CRR)

**Same-Region Replication (SRR)** copies objects between buckets within the same AWS Region.

```
US-East-1
↓
Source Bucket
↓
Replication
↓
Destination Bucket
US-East-1
```

Common use cases: development and testing, log aggregation, multiple team access, compliance copies.

**Cross-Region Replication (CRR)** copies objects to a bucket located in another AWS Region.

```
US-East-1
↓
Source Bucket
↓
Replication
↓
EU-West-1
↓
Destination Bucket
```

Benefits: disaster recovery, global availability, regulatory compliance, geographic redundancy.

### Replication Workflow

```
Application
↓
Upload File
↓
Source Bucket
↓
Replication Rule
↓
Destination Bucket
```

Replication happens automatically after the object is successfully uploaded.

### Replication Requirements

To configure replication, the following are required:

- Versioning enabled on both buckets
- IAM Role for replication
- Replication Rule
- Destination bucket permissions

Without Versioning, replication cannot be configured.

### What Can Be Replicated?

Amazon S3 can replicate objects, object metadata, object tags, ACLs (if enabled), and delete markers (optional). Replication helps maintain consistency between buckets.

### Replication Use Cases

**Disaster Recovery** — Maintain a backup copy in another AWS Region.

**Global Applications** — Store data closer to users in different geographic locations.

**Compliance** — Maintain copies of business data in multiple Regions.

**Backup Strategy** — Automatically duplicate critical business files.

### CRR vs SRR

| Feature | SRR | CRR |
|---------|-----|-----|
| Region | Same AWS Region | Different AWS Regions |
| Disaster Recovery | Limited | Excellent |
| Latency Improvement | No | Yes |
| Compliance | Yes | Yes |
| Geographic Redundancy | No | Yes |

### Best Practices (Events & Replication)

- Enable Versioning before configuring Replication.
- Use CRR for disaster recovery.
- Use SRR for internal backups and multi-team access.
- Monitor replication status using Amazon CloudWatch.
- Encrypt replicated objects using SSE-KMS when handling sensitive data.
- Regularly verify replication health.

---

## Multipart Upload & Transfer Acceleration

As organizations store larger files such as videos, database backups, machine learning datasets, and log archives, uploading them efficiently becomes increasingly important.

Amazon S3 provides two features to solve these challenges:

- **Multipart Upload** – Upload large files in smaller parts.
- **Transfer Acceleration** – Speed up uploads using the AWS Global Network.

Together, these features improve reliability, performance, and user experience.

### What is Multipart Upload?

Multipart Upload allows you to divide a large object into multiple smaller parts and upload them independently.

After all parts are uploaded successfully, Amazon S3 automatically combines them into a single object.

Instead of uploading one large file (where a failure means restarting the entire upload), Multipart Upload works like this:

```
5 GB File
↓
Split Into Parts
↓
Part 1
Part 2
Part 3
Part 4
↓
Upload Independently
↓
Amazon S3
↓
Combine Parts
↓
Single Object
```

### How Multipart Upload Works

The Multipart Upload process consists of three steps.

**Step 1 – Initiate Upload**

Amazon S3 generates an Upload ID.

```
Application
↓
Initiate Multipart Upload
↓
Upload ID Created
```

**Step 2 – Upload Individual Parts**

Each part uploads independently.

```
Upload ID
↓
Part 1
Part 2
Part 3
Part 4
↓
Amazon S3
```

Each uploaded part receives an **ETag**, which identifies it.

**Step 3 – Complete Upload**

After all parts are uploaded:

```
Complete Multipart Upload
↓
Amazon S3
↓
Merge All Parts
↓
Single Object Created
```

The uploaded object behaves exactly like a normal S3 object.

### Benefits of Multipart Upload

**Faster Uploads** — Multiple parts can be uploaded simultaneously, significantly reducing upload time.

**Resume Interrupted Uploads** — If one part fails, only that part needs to be uploaded again. There is no need to restart the entire upload.

**Better Reliability** — Network interruptions affect only the failed part rather than the complete file.

**Improved Performance** — Parallel uploads maximize available bandwidth.

### Multipart Upload Limits

Amazon S3 supports:

| Property | Value |
|----------|-------|
| Maximum Object Size | 5 TB |
| Maximum Parts | 10,000 |
| Part Size | 5 MB – 5 GB (except the last part) |

Multipart Upload is recommended for objects larger than **100 MB** and becomes especially beneficial for files larger than **1 GB**.

### Real-World Example: 100 GB Video Upload

A media company uploads a **100 GB video**.

Without Multipart Upload, a lost connection means restarting from the beginning.

With Multipart Upload:

```
100 GB Video
↓
Split Into 100 Parts
↓
Only Failed Parts Retry
↓
Upload Completes Successfully
```

This saves time and bandwidth.

### What is Transfer Acceleration?

Transfer Acceleration improves upload and download speeds by routing traffic through the **AWS Global Network**.

Instead of sending data directly to the S3 bucket, users connect to the nearest AWS Edge Location.

```
User
↓
Nearest AWS Edge Location
↓
AWS Global Network
↓
Amazon S3 Bucket
```

This reduces latency and improves transfer performance over long distances.

### How Transfer Acceleration Works

Without Transfer Acceleration, traffic travels over the public internet directly to the bucket.

With Transfer Acceleration:

```
User
↓
Nearest Edge Location
↓
AWS Backbone Network
↓
Amazon S3 Bucket
```

The AWS backbone network is optimized for speed and reliability.

### Transfer Acceleration Example

Suppose the bucket Region is US-East-1 and the user is located in India.

Without Transfer Acceleration, traffic travels: India → Public Internet → US-East-1.

With Transfer Acceleration: India → Mumbai Edge Location → AWS Global Network → US-East-1.

The result is faster uploads with lower latency.

### Benefits of Transfer Acceleration

**Faster Global Uploads** — Ideal for geographically distributed users.

**Lower Latency** — Requests enter the AWS network at the nearest Edge Location.

**Better Performance** — AWS routes traffic using its private high-speed backbone.

**Improved User Experience** — Users experience faster uploads without changing application logic.

### Multipart Upload vs Transfer Acceleration

| Feature | Multipart Upload | Transfer Acceleration |
|----------|------------------|-----------------------|
| Purpose | Split large files | Speed up transfers |
| Best For | Large objects | Long-distance uploads |
| Retry Failed Uploads | ✅ Yes | ❌ No |
| Parallel Upload | ✅ Yes | ❌ No |
| Uses AWS Edge Locations | ❌ No | ✅ Yes |
| Can Be Used Together | ✅ Yes | ✅ Yes |

Both features complement each other and are commonly used together for large global uploads.

### Real-World Production Scenario: Video Streaming Uploads

A video streaming company receives uploads from users worldwide.

```
User
↓
Nearest AWS Edge Location
↓
Transfer Acceleration
↓
Multipart Upload
↓
Amazon S3
↓
Video Stored Successfully
```

Benefits: faster uploads, lower latency, automatic retry of failed parts, reliable transfer of large files, better user experience.

### Best Practices (Upload Performance)

- Use Multipart Upload for files larger than 100 MB.
- Enable Transfer Acceleration for global users.
- Retry only failed parts during Multipart Upload.
- Remove incomplete Multipart Uploads using Lifecycle Rules.
- Monitor upload performance using Amazon CloudWatch.
- Test Transfer Acceleration before enabling it in production.

---

## Object Lock, Access Points, Batch Operations & Storage Lens

As organizations store petabytes of data in Amazon S3, managing security, compliance, access control, and storage analytics becomes increasingly important.

Amazon S3 provides several advanced features to address these challenges:

- Object Lock
- S3 Access Points
- Batch Operations
- S3 Storage Lens

These features help organizations protect critical data, simplify access management, automate large-scale operations, and optimize storage usage.

### Amazon S3 Object Lock

Object Lock is a feature that prevents objects from being modified or deleted for a specified retention period.

This feature supports **WORM (Write Once Read Many)** storage.

```
Upload Object
↓
Object Lock Enabled
↓
Cannot Modify
Cannot Delete
↓
Retention Period Ends
```

Object Lock is commonly used for compliance and legal requirements.

**Why Use Object Lock?**

Organizations often need to protect important files such as financial records, medical records, legal documents, audit logs, and compliance reports.

Object Lock ensures these files cannot be accidentally or intentionally changed.

**Object Lock Modes**

Amazon S3 provides two protection modes.

*Governance Mode* — Users with special IAM permissions can remove or bypass the lock.

```
Object Locked
↓
Administrator
↓
Special Permission
↓
Can Remove Lock
```

Suitable for internal company policies.

*Compliance Mode* — No user, including the AWS account root user, can modify or delete the object until the retention period expires.

```
Object Locked
↓
Everyone Blocked
↓
Retention Ends
↓
Object Can Be Modified
```

This mode is designed for strict regulatory compliance.

**Retention Period**

When enabling Object Lock, define how long an object should remain protected.

| Document | Retention |
|----------|-----------|
| Audit Logs | 7 Years |
| Medical Records | 10 Years |
| Financial Reports | 5 Years |

During the retention period, the object remains immutable.

**Legal Hold**

A Legal Hold prevents an object from being deleted indefinitely until the hold is manually removed.

Unlike retention periods, Legal Holds do not expire automatically.

```
Object
↓
Legal Hold Enabled
↓
Protected Forever
↓
Manual Removal Required
```

This is commonly used during legal investigations and audits.

### Amazon S3 Access Points

Managing permissions for a single bucket can become difficult when multiple applications or teams require different levels of access.

S3 Access Points simplify bucket access management. Instead of one complex bucket policy serving many users, create dedicated Access Points for each application or team.

**Access Point Architecture**

```
                Amazon S3 Bucket

        ┌──────────┼──────────┐
        │          │          │
        ▼          ▼          ▼

Access Point A
Access Point B
Access Point C

        │          │          │

Application A
Application B
Analytics Team
```

Each Access Point has its own network settings and access policy.

**Benefits of Access Points**

- Simplifies permission management
- Supports multiple applications
- Reduces policy complexity
- Improves security
- Integrates with Amazon VPC

### Amazon S3 Batch Operations

Managing millions of objects individually is time-consuming.

Batch Operations perform bulk actions on large numbers of objects.

```
1 Million Objects
↓
Single Batch Job
↓
Perform Action
↓
Completed
```

**Supported Batch Operations**

Batch Operations can copy objects, replace object tags, restore archived objects, modify ACLs, invoke AWS Lambda, and update object metadata. One job can process billions of objects.

**Batch Operations Workflow**

```
Inventory Report
↓
Select Objects
↓
Create Batch Job
↓
Amazon S3
↓
Bulk Processing
```

Amazon S3 automatically tracks job progress and provides completion reports.

### Amazon S3 Storage Lens

Storage Lens provides visibility into how Amazon S3 is being used across an AWS account.

It helps answer questions like: Which bucket stores the most data? Which buckets have the highest object count? How many previous versions exist? Which storage classes consume the most space?

**Storage Lens Dashboard**

Storage Lens provides metrics such as Total Storage, Object Count, Current Versions, Non-Current Versions, Delete Markers, Encryption Status, and Lifecycle Rule Coverage.

```
AWS Account
↓
Storage Lens Dashboard
↓
Bucket Analytics
↓
Recommendations
```

**Benefits of Storage Lens**

**Visibility** — Monitor storage usage across all buckets.

**Cost Optimization** — Identify unused or rarely accessed data.

**Security Insights** — Review encryption and versioning adoption.

**Operational Efficiency** — Monitor lifecycle coverage and storage trends.

### Real-World Production Scenario: Multinational Bank

A multinational bank stores customer records in Amazon S3.

```
Customer Data
↓
Object Lock Enabled
↓
Compliance Mode
↓
Access Points
↓
Different Departments
↓
Batch Operations
↓
Update Metadata
↓
Storage Lens
↓
Monthly Storage Reports
```

Benefits: regulatory compliance, secure department-level access, automated bulk management, better storage visibility.

### Best Practices (Object Lock, Access Points, Batch Operations, Storage Lens)

**Object Lock**

- Use Compliance Mode for regulated industries.
- Enable Versioning before Object Lock.
- Configure appropriate retention periods.

**Access Points**

- Create separate Access Points for different applications.
- Apply the Principle of Least Privilege.
- Restrict access using VPC endpoints where possible.

**Batch Operations**

- Test jobs on a small object set first.
- Monitor job completion reports.
- Schedule large jobs during low-traffic periods.

**Storage Lens**

- Review dashboards regularly.
- Identify unused storage.
- Optimize Lifecycle Rules based on Storage Lens insights.

---

## Production Architecture

Below is an example of a production-ready Amazon S3 architecture that combines the features covered in this guide.

```
                      Users
                        │
                        ▼
                  Amazon CloudFront
                        │
                        ▼
                  Amazon S3 Bucket

      ┌────────────┼────────────┬─────────────┐
      │            │            │             │
      ▼            ▼            ▼             ▼

Static Website  Event        Versioning    Object Lock
Hosting         Notifications & Lifecycle

                    │
                    ▼

             AWS Lambda / SNS / SQS

                    │
                    ▼

          Automated Processing

                    │
                    ▼

          Cross-Region Replication

                    │
                    ▼

         Disaster Recovery Bucket

                    │
                    ▼

             Storage Lens Reports
```

This architecture provides high availability, disaster recovery, automation, compliance, global performance, and cost optimization.

---

## Production Best Practices

### 1. Enable Versioning

Always enable Versioning for production buckets.

Benefits: recover deleted files, restore previous versions, protect against accidental overwrites.

### 2. Enable Lifecycle Rules

Lifecycle Rules help reduce storage costs, remove old object versions, and archive infrequently accessed data.

Example:

```
30 Days
↓
Standard-IA
↓
90 Days
↓
Glacier Flexible Retrieval
↓
365 Days
↓
Deep Archive
```

### 3. Enable Server-Side Encryption

Protect stored data using SSE-S3 or SSE-KMS.

Encryption should be enabled by default for production workloads.

### 4. Use IAM Roles

Avoid storing AWS Access Keys in applications. Instead:

```
Application
↓
IAM Role
↓
Amazon S3
```

Temporary credentials are more secure than long-term access keys.

### 5. Block Public Access

Unless hosting a public website, always enable Block Public Access. This helps prevent accidental exposure of sensitive data.

### 6. Use Replication

Use Same-Region Replication (SRR) and Cross-Region Replication (CRR) for disaster recovery, compliance, backup, and high availability.

### 7. Monitor Storage

Regularly monitor Object Count, Storage Size, Lifecycle Rules, Version Count, and Replication Status.

Recommended AWS services: Amazon CloudWatch, AWS CloudTrail, Amazon S3 Storage Lens.

### 8. Secure Bucket Policies

Grant only the required permissions. Follow the **Principle of Least Privilege**.

---

## Troubleshooting

### Issue 1: Static Website Returns "403 Forbidden"

**Possible Causes:** Block Public Access enabled, Bucket Policy missing, objects not publicly readable.

**Solution:** Verify Bucket Policy, Public Access settings, and Website Hosting configuration.

### Issue 2: Event Notifications Not Triggering

**Possible Causes:** Incorrect event configuration, missing Lambda permissions, wrong object prefix or suffix filters.

**Solution:** Verify event configuration, IAM permissions, and the destination service.

### Issue 3: Replication Not Working

**Possible Causes:** Versioning disabled, IAM Role missing, destination bucket permissions incorrect.

**Solution:** Confirm Versioning is enabled on both buckets, the Replication Rule is configured, and the IAM Role has replication permissions.

### Issue 4: Multipart Upload Failed

**Possible Causes:** Network interruption, incomplete upload, upload timeout.

**Solution:** Retry only the failed parts. Configure Lifecycle Rules to remove incomplete Multipart Uploads.

### Issue 5: Storage Costs Increasing

**Possible Causes:** Previous object versions, no Lifecycle Rules, large unused objects.

**Solution:** Review the Storage Lens Dashboard, Lifecycle Policies, Previous Versions, and Glacier transition opportunities.

---

## Real-World Use Cases Summary

**Static Website Hosting** — Personal portfolio, company website, product landing page.

**Event Notifications** — Image processing, video conversion, automatic file validation.

**Replication** — Disaster recovery, cross-region backup, compliance.

**Multipart Upload** — Video uploads, database backups, large log files.

**Object Lock** — Financial records, medical records, audit reports.

**Storage Lens** — Cost analysis, bucket optimization, capacity planning.

---

## Interview Questions

**1. What is Static Website Hosting?**

A feature that allows Amazon S3 to host static websites using HTML, CSS, JavaScript, and media files.

**2. Which AWS services can receive S3 Event Notifications?**

Amazon SNS, Amazon SQS, and AWS Lambda.

**3. What is Cross-Region Replication (CRR)?**

CRR automatically replicates objects from one AWS Region to another for disaster recovery and compliance.

**4. What is Same-Region Replication (SRR)?**

SRR replicates objects between buckets within the same AWS Region.

**5. Why is Multipart Upload useful?**

It improves upload performance and allows failed parts to be retried without restarting the entire upload.

**6. What is Transfer Acceleration?**

A feature that speeds up uploads and downloads using AWS Edge Locations and the AWS Global Network.

**7. What is Object Lock?**

A feature that prevents objects from being modified or deleted during a defined retention period.

**8. What is the difference between Governance Mode and Compliance Mode?**

Governance Mode: authorized users can bypass the lock. Compliance Mode: no user, including the root user, can modify or delete the object until the retention period expires.

**9. What are S3 Access Points?**

Dedicated endpoints with individual access policies that simplify secure access to shared S3 buckets.

**10. What is Amazon S3 Storage Lens?**

A monitoring and analytics service that provides visibility into storage usage, object counts, versioning, encryption, and Lifecycle adoption.

---

## Summary

In this guide, you learned:

- Static Website Hosting
- Website Endpoints
- Index & Error Documents
- Event Notifications
- Amazon SNS
- Amazon SQS
- AWS Lambda Integration
- Same-Region Replication (SRR)
- Cross-Region Replication (CRR)
- Multipart Upload
- Transfer Acceleration
- Object Lock
- Governance & Compliance Modes
- Legal Hold
- S3 Access Points
- Batch Operations
- Storage Lens
- Production Best Practices
- Troubleshooting
- Interview Questions

These advanced features make Amazon S3 far more than an object storage service. They enable organizations to build scalable, automated, secure, and enterprise-ready storage solutions that integrate seamlessly with the broader AWS ecosystem.

---

## 🎉 Congratulations!

You have successfully completed **Amazon S3 Advanced Features**.

You can now:

- ✅ Host static websites using Amazon S3
- ✅ Build event-driven architectures with SNS, SQS, and Lambda
- ✅ Configure Same-Region and Cross-Region Replication
- ✅ Optimize large file uploads using Multipart Upload
- ✅ Improve global transfer performance with Transfer Acceleration
- ✅ Protect data using Object Lock and Legal Hold
- ✅ Simplify access management with S3 Access Points
- ✅ Perform bulk operations with Batch Operations
- ✅ Analyze storage usage using Storage Lens
- ✅ Design production-ready Amazon S3 solutions
