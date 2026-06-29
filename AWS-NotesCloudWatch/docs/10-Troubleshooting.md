# 🛠️ Amazon CloudWatch Troubleshooting Guide

## 📖 Introduction

Amazon CloudWatch is a powerful monitoring service, but issues can occur due to configuration errors, IAM permissions, agent problems, incorrect alarm settings, or network connectivity.

This guide covers the most common CloudWatch problems, their causes, troubleshooting steps, and best practices for resolving them in production environments.

---

# 🎯 Troubleshooting Workflow

```text
Problem Detected
        │
        ▼
Identify the Service
        │
        ▼
Check Metrics / Logs
        │
        ▼
Verify IAM Permissions
        │
        ▼
Validate Configuration
        │
        ▼
Apply Fix
        │
        ▼
Test & Monitor
```

---

# 🚨 Issue 1: Metrics Not Appearing

## Symptoms

* EC2 CPU graph is empty
* Custom metrics missing
* Dashboard widgets show **No Data**

### Possible Causes

* Incorrect AWS Region
* CloudWatch Agent not running
* Metric not published
* IAM role missing permissions
* Wrong namespace or dimensions

### Troubleshooting Steps

1. Verify you are in the correct AWS Region.
2. Confirm the resource is running.
3. Check if the metric exists:

```bash
aws cloudwatch list-metrics
```

4. Verify the IAM role has CloudWatch permissions.
5. Check CloudWatch Agent status (for custom metrics).

### Solution

* Restart the CloudWatch Agent.
* Correct namespace and dimensions.
* Ensure the metric is being published.

---

# 🚨 Issue 2: Memory Metrics Missing on EC2

## Symptoms

* CPU metrics are visible.
* Memory utilization is unavailable.

### Cause

Amazon EC2 does **not** publish memory metrics by default.

### Solution

1. Install the CloudWatch Agent.
2. Configure memory collection.
3. Attach an IAM role with CloudWatch permissions.
4. Restart the agent.

Verify:

```bash
sudo systemctl status amazon-cloudwatch-agent
```

---

# 🚨 Issue 3: CloudWatch Agent Not Running

## Symptoms

* No OS metrics
* No application logs
* Agent status shows **inactive**

### Troubleshooting

Check service status:

```bash
sudo systemctl status amazon-cloudwatch-agent
```

Restart the agent:

```bash
sudo systemctl restart amazon-cloudwatch-agent
```

View logs:

```bash
cat /opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log
```

### Common Causes

* Invalid configuration file
* IAM permission issues
* Network connectivity problems
* Agent installation failure

---

# 🚨 Issue 4: Logs Not Appearing

## Symptoms

* Empty Log Group
* Missing Log Streams
* New log entries are not uploaded

### Possible Causes

* Incorrect log file path
* CloudWatch Agent stopped
* IAM permission issues
* Log file not being updated
* Network connectivity problems

### Verify

```bash
sudo tail -f /var/log/messages
```

Check agent configuration:

```bash
sudo amazon-cloudwatch-agent-ctl -a status
```

### Solution

* Correct log file paths.
* Restart the CloudWatch Agent.
* Verify IAM permissions.
* Ensure the application is writing logs.

---

# 🚨 Issue 5: Alarm Not Triggering

## Symptoms

* Metric exceeds threshold.
* Alarm remains in **OK** state.

### Possible Causes

* Wrong threshold
* Incorrect statistic
* Evaluation period too long
* Metric not published
* Alarm disabled

### Troubleshooting

Verify:

* Metric value
* Threshold
* Statistic (Average, Maximum, Sum)
* Evaluation period
* Comparison operator

### Example

```text
CPU = 82%

Threshold = 90%

Result → Alarm remains OK
```

Adjust the threshold if required.

---

# 🚨 Issue 6: Alarm Stuck in INSUFFICIENT_DATA

## Symptoms

Alarm never changes state.

### Causes

* No metric data
* Resource stopped
* Wrong dimensions
* Agent not publishing metrics

### Solution

* Confirm metrics are available.
* Verify namespace and dimensions.
* Check CloudWatch Agent status.
* Wait for sufficient evaluation periods.

---

# 🚨 Issue 7: SNS Notifications Not Received

## Symptoms

* Alarm changes to **ALARM**
* No email or SMS notification

### Troubleshooting

* Verify the SNS topic.
* Confirm subscription.
* Check email confirmation.
* Validate IAM permissions.
* Ensure the alarm action references the correct SNS topic.

List subscriptions:

```bash
aws sns list-subscriptions
```

---

# 🚨 Issue 8: Dashboard Shows No Data

## Symptoms

Widgets display:

```text
No Data Available
```

### Causes

* Wrong Region
* Incorrect namespace
* Wrong dimensions
* Metric deleted
* Resource terminated

### Solution

* Verify Region.
* Check metric configuration.
* Refresh dashboard.
* Validate widget settings.

---

# 🚨 Issue 9: EventBridge Rule Not Triggering

## Symptoms

Automation does not execute.

### Possible Causes

* Event pattern mismatch
* Incorrect target
* IAM permission issues
* Rule disabled

### Verify

* Event pattern
* Rule status
* Target configuration
* CloudTrail logs

### Solution

Correct the event pattern and test the rule.

---

# 🚨 Issue 10: High CloudWatch Costs

## Symptoms

Unexpected CloudWatch charges.

### Common Reasons

* Too many custom metrics
* Excessive log storage
* High-resolution metrics
* Large number of alarms
* Logs retained indefinitely

### Cost Optimization

* Delete unused metrics.
* Remove obsolete alarms.
* Configure retention policies.
* Use standard-resolution metrics where appropriate.
* Archive old logs.

---

# 🔐 IAM Permission Checklist

Verify the IAM role includes permissions such as:

* cloudwatch:GetMetricData
* cloudwatch:PutMetricData
* logs:CreateLogGroup
* logs:CreateLogStream
* logs:PutLogEvents
* sns:Publish
* events:PutRule

Always follow the principle of least privilege.

---

# 📋 Production Troubleshooting Checklist

Before escalating an issue, verify:

* Correct AWS Region
* Resource health
* IAM permissions
* CloudWatch Agent status
* Log Group and Log Stream
* Alarm configuration
* SNS subscription
* EventBridge rule
* Dashboard widgets
* Network connectivity

---

# 🌍 Real-World Scenario

A production web application experiences slow response times.

### Investigation

1. Check EC2 CPUUtilization.
2. Review memory metrics.
3. Analyze application logs using CloudWatch Logs Insights.
4. Verify CloudWatch Alarm history.
5. Check Auto Scaling activity.
6. Review EventBridge automation.
7. Confirm SNS notifications were sent.

### Resolution

* Launch additional EC2 instances using Auto Scaling.
* Optimize the application.
* Tune alarm thresholds.
* Update dashboards for better visibility.

---

# 💡 Troubleshooting Best Practices

* Monitor critical metrics continuously.
* Test alarms and notifications regularly.
* Keep the CloudWatch Agent updated.
* Use descriptive names for metrics and alarms.
* Configure appropriate log retention.
* Review CloudWatch costs periodically.
* Document recurring issues and resolutions.

---

# 🎓 AWS SAA-C03 Exam Tips

* Memory metrics require the CloudWatch Agent.
* Logs require Log Groups and Log Streams.
* Alarms monitor metrics—not logs.
* SNS is commonly used for notifications.
* EventBridge enables event-driven automation.
* Incorrect Regions or dimensions are common causes of missing metrics.

---

# ❓ Interview Questions

1. Why are memory metrics missing on EC2?
2. How do you troubleshoot missing CloudWatch Logs?
3. What causes an alarm to remain in **INSUFFICIENT_DATA**?
4. Why are SNS notifications not received?
5. How do you troubleshoot EventBridge rules?
6. How can CloudWatch costs be reduced?
7. What IAM permissions are required for the CloudWatch Agent?
8. Why might a dashboard display **No Data**?
9. How do you investigate missing custom metrics?
10. What troubleshooting steps would you follow during a production incident?

---

# 📝 Key Takeaways

* Verify AWS Region, IAM permissions, and resource health first.
* Install and configure the CloudWatch Agent for OS metrics and custom logs.
* Ensure alarms, dashboards, and EventBridge rules are configured correctly.
* Use Logs Insights and CloudWatch Metrics together for faster root cause analysis.
* Implement retention policies and review usage regularly to control CloudWatch costs.
* A structured troubleshooting process minimizes downtime and improves operational efficiency.

---

# 🎉 Congratulations!

You have completed the **AWS-NotesCloudWatch** learning series.

## 📚 Topics Covered

* ✅ Introduction
* ✅ Architecture
* ✅ Metrics
* ✅ CloudWatch Logs
* ✅ Dashboards
* ✅ Alarms
* ✅ EventBridge
* ✅ Best Practices
* ✅ Interview Questions
* ✅ Troubleshooting

---

## 🚀 What's Next?

Continue your AWS learning journey with:

* **Amazon CloudTrail**
* **Amazon SNS**
* **AWS Systems Manager (SSM)**
* **Amazon EventBridge (Advanced)**
* **AWS X-Ray**
* **AWS Config**
* **AWS Trusted Advisor**
* **Amazon OpenSearch Service**
* **AWS CloudFormation**
* **Amazon ECS & EKS Monitoring**

These services complement CloudWatch and help you build strong observability, automation, and operational skills for real-world cloud environments and AWS certification exams.

