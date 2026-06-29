# 💼 Amazon CloudWatch Interview Questions

## 📖 Introduction

Amazon CloudWatch is one of the most frequently discussed AWS services in technical interviews for roles such as:

* AWS Cloud Engineer
* DevOps Engineer
* Site Reliability Engineer (SRE)
* Linux & Production Support Engineer
* Cloud Administrator
* AWS Solutions Architect

This chapter includes commonly asked interview questions ranging from beginner to advanced levels, along with scenario-based questions and a quick revision guide.

---

# 🟢 Beginner Level Questions

## 1. What is Amazon CloudWatch?

**Answer:**
Amazon CloudWatch is a fully managed monitoring and observability service that collects metrics, logs, events, and alarms from AWS resources and applications. It helps monitor performance, troubleshoot issues, and automate operational tasks.

---

## 2. What can CloudWatch monitor?

CloudWatch can monitor:

* Amazon EC2
* Amazon RDS
* AWS Lambda
* Amazon ECS
* Amazon EKS
* Amazon S3
* API Gateway
* Load Balancers
* Custom Applications
* On-premises Servers (using CloudWatch Agent)

---

## 3. What are CloudWatch Metrics?

Metrics are time-ordered numerical data points that represent the performance or health of AWS resources.

Example:

* CPUUtilization
* NetworkIn
* FreeStorageSpace
* Invocations

---

## 4. What is a Namespace?

A Namespace is a container that organizes related metrics.

Examples:

```text id="q0x3vy"
AWS/EC2
AWS/RDS
AWS/Lambda
Custom/Application
```

---

## 5. What are Dimensions?

Dimensions are key-value pairs used to uniquely identify a metric.

Example:

```text id="vjlwmq"
InstanceId = i-0123456789abcdef0
```

---

## 6. What are Standard Metrics?

Standard Metrics are automatically published by AWS services without additional configuration.

---

## 7. What are Custom Metrics?

Custom Metrics are user-defined metrics published using the AWS SDK, CLI, API, or CloudWatch Agent.

---

## 8. What is the CloudWatch Agent?

The CloudWatch Agent collects operating system metrics such as:

* Memory utilization
* Disk usage
* Swap usage
* Running processes
* Custom log files

---

## 9. Why are memory metrics not available by default on EC2?

Because Amazon EC2 only publishes infrastructure metrics by default. Memory utilization requires the CloudWatch Agent.

---

## 10. What is the difference between CloudWatch and CloudTrail?

| CloudWatch                   | CloudTrail                       |
| ---------------------------- | -------------------------------- |
| Monitoring and observability | API activity auditing            |
| Collects metrics and logs    | Records AWS API calls            |
| Creates alarms               | Tracks user activity             |
| Supports dashboards          | Supports compliance and auditing |

---

# 🟡 Intermediate Level Questions

## 11. What is a CloudWatch Alarm?

A CloudWatch Alarm monitors a metric and changes its state when a threshold is crossed. It can trigger actions such as SNS notifications, Lambda functions, Auto Scaling, or EventBridge.

---

## 12. What are the three alarm states?

* ✅ OK
* 🚨 ALARM
* ❓ INSUFFICIENT_DATA

---

## 13. What actions can CloudWatch Alarms perform?

* Send SNS notifications
* Invoke Lambda
* Trigger Auto Scaling
* Recover EC2 instances
* Publish EventBridge events

---

## 14. What is a CloudWatch Dashboard?

A dashboard provides a centralized visual view of metrics, alarms, and operational data across AWS services.

---

## 15. What is a Log Group?

A Log Group is a logical container that stores one or more Log Streams.

---

## 16. What is a Log Stream?

A Log Stream is a sequence of log events from a single source, such as an EC2 instance or Lambda function.

---

## 17. What is CloudWatch Logs Insights?

CloudWatch Logs Insights is an interactive query service used to search and analyze log data.

---

## 18. What is a Metric Filter?

A Metric Filter converts matching log patterns into CloudWatch Metrics.

Example:

```text id="5q02vh"
ERROR
```

This pattern can create a custom metric whenever an error appears in the logs.

---

## 19. What is a Subscription Filter?

A Subscription Filter streams log events to services such as:

* AWS Lambda
* Amazon Kinesis Data Streams
* Amazon Kinesis Data Firehose
* Amazon OpenSearch Service

---

## 20. What is Amazon EventBridge?

Amazon EventBridge is AWS's event routing service that enables event-driven automation by delivering events from AWS services, applications, and SaaS platforms to target services.

---

# 🔴 Advanced Level Questions

## 21. What is a Composite Alarm?

A Composite Alarm combines multiple metric alarms using logical operators (AND, OR) to reduce alert noise and improve monitoring.

---

## 22. What is Anomaly Detection?

CloudWatch Anomaly Detection uses machine learning to identify unusual metric behavior and automatically adjust thresholds.

---

## 23. How do you monitor memory utilization on EC2?

Install and configure the CloudWatch Agent with the appropriate IAM role and configuration file.

---

## 24. How can CloudWatch trigger Auto Scaling?

A CloudWatch Alarm monitors CPU utilization or another metric and triggers an Auto Scaling policy when the configured threshold is exceeded.

---

## 25. What is Cross-Account Observability?

Cross-Account Observability allows a central monitoring account to view metrics, logs, and traces from multiple AWS accounts.

---

# 🧩 Scenario-Based Questions

## 26. CPU Utilization Suddenly Reaches 95%

**Question:** What would you do?

**Answer:**

* Check CloudWatch Metrics
* Review CloudWatch Logs
* Verify application performance
* Inspect Auto Scaling activity
* Increase capacity if required
* Analyze root cause

---

## 27. CloudWatch Alarm Is Not Triggering

Possible reasons:

* Incorrect threshold
* Wrong evaluation period
* Metric not being published
* Alarm disabled
* Missing IAM permissions

---

## 28. EC2 Memory Utilization Is Missing

**Answer:**

Memory metrics are not available by default. Install the CloudWatch Agent and ensure it has the necessary IAM permissions.

---

## 29. Lambda Function Is Failing

Investigation steps:

* Review CloudWatch Logs
* Check execution duration
* Verify timeout settings
* Analyze error messages
* Monitor invocation metrics

---

## 30. Logs Are Not Appearing in CloudWatch

Troubleshooting:

* Verify CloudWatch Agent status
* Check IAM permissions
* Confirm log file paths
* Review agent configuration
* Validate network connectivity

---

# ⚡ Rapid Fire Questions

| Question                                 | Answer             |
| ---------------------------------------- | ------------------ |
| Default EC2 memory metrics available?    | ❌ No               |
| Default CPU metrics available?           | ✅ Yes              |
| Which service stores logs?               | CloudWatch Logs    |
| Which service sends notifications?       | Amazon SNS         |
| Which service routes events?             | Amazon EventBridge |
| Which service audits API calls?          | AWS CloudTrail     |
| Which feature queries logs?              | Logs Insights      |
| Which feature creates metrics from logs? | Metric Filters     |
| Which feature visualizes metrics?        | Dashboards         |
| Which feature monitors thresholds?       | Alarms             |

---

# 📚 AWS SAA-C03 Revision Table

| Topic                | Key Point                         |
| -------------------- | --------------------------------- |
| Metrics              | Numerical performance data        |
| Logs                 | Application and system logs       |
| Dashboards           | Visual monitoring                 |
| Alarms               | Threshold-based monitoring        |
| EventBridge          | Event-driven automation           |
| SNS                  | Notifications                     |
| CloudWatch Agent     | Memory, disk, and OS metrics      |
| Logs Insights        | Log analysis                      |
| Metric Filters       | Convert logs into metrics         |
| Subscription Filters | Stream logs to other AWS services |

---

# 💡 Interview Tips

* Understand the difference between CloudWatch and CloudTrail.
* Be able to explain the relationship between Metrics, Alarms, and Dashboards.
* Know when to use the CloudWatch Agent.
* Practice creating alarms and dashboards in the AWS Console.
* Be comfortable with basic AWS CLI commands for CloudWatch.
* Learn real-world monitoring scenarios rather than memorizing definitions.

---

# 📝 Key Takeaways

* CloudWatch is a core AWS monitoring service used in almost every production environment.
* Interview questions often focus on practical scenarios and troubleshooting.
* Understanding Metrics, Logs, Alarms, Dashboards, and EventBridge is essential.
* Hands-on experience with CloudWatch significantly improves interview performance.

---

# 📚 What's Next?

In the final chapter, **10-Troubleshooting.md**, you will learn:

* Common CloudWatch issues
* Troubleshooting metrics and alarms
* Log collection problems
* CloudWatch Agent issues
* SNS notification failures
* EventBridge troubleshooting
* Best practices for production environments

