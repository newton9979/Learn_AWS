# 🗑️ Task 06 - Terminate an EC2 Instance

## 🎯 Objective

Learn how to safely terminate an Amazon EC2 instance, understand what happens to attached resources, explore termination protection, and understand the cost implications of terminating an instance.

---

# 📚 Learning Outcomes

After completing this task, you will be able to:

* Understand what EC2 termination means
* Enable and disable termination protection
* Safely terminate an EC2 instance
* Understand what resources are deleted and retained
* Verify instance termination
* Apply AWS cost optimization best practices

---

# 📋 Prerequisites

Before starting, ensure you have:

* AWS Account
* One running or stopped EC2 instance
* EC2 Console access
* Basic understanding of the EC2 lifecycle

---

# EC2 Termination Workflow

```text
Launch Instance
       │
       ▼
    Running
       │
       ▼
(Optional)
Enable Termination Protection
       │
       ▼
Disable Protection
       │
       ▼
Terminate Instance
       │
       ▼
Shutting Down
       │
       ▼
Terminated
```

---

# Step 1 — Open EC2 Dashboard

Navigate to:

```text
AWS Console

↓

EC2

↓

Instances
```

Select the EC2 instance you want to terminate.

---

# Step 2 — Check Termination Protection

Select the instance.

Navigate to:

```text
Actions

↓

Instance Settings

↓

Change Termination Protection
```

If **Termination Protection** is enabled:

* Disable it.
* Save the changes.

> **Note:** You cannot terminate an instance while termination protection is enabled.

---

# Step 3 — Review Attached Resources

Before terminating, verify the following:

* Instance ID
* Instance Name
* AMI
* Instance Type
* Security Groups
* Key Pair
* Attached EBS Volumes
* Elastic IP (if any)

---

# Step 4 — Terminate the Instance

Select the instance.

Click:

```text
Instance State

↓

Terminate Instance
```

AWS displays a confirmation dialog.

Click:

```text
Terminate
```

---

# Step 5 — Monitor Instance State

The instance state changes as follows:

```text
Running

↓

Shutting-down

↓

Terminated
```

Wait until the instance reaches the **Terminated** state.

---

# Step 6 — Verify Termination

Confirm:

* Instance State = **Terminated**
* SSH or RDP connections fail
* Instance cannot be started again
* The instance remains visible for a short period before disappearing from the default view

---

# What Happens After Termination?

| Resource              | Status After Termination                  |
| --------------------- | ----------------------------------------- |
| EC2 Instance          | Deleted Permanently                       |
| Instance Store Volume | Deleted                                   |
| Public IPv4 Address   | Released                                  |
| Private IPv4 Address  | Released                                  |
| Elastic IP            | Detached (still billed if not associated) |
| Security Group        | Retained                                  |
| Key Pair              | Retained                                  |
| VPC                   | Retained                                  |
| Subnet                | Retained                                  |
| IAM Role              | Retained                                  |
| EBS Volume            | Deleted by default*                       |

> **Note:** If **Delete on Termination** is disabled for an EBS volume, the volume is retained.

---

# Delete on Termination

During instance launch, each EBS volume has a setting:

```text
Delete on Termination

☑ Enabled (Default)
```

If enabled:

* EBS volume is automatically deleted.

If disabled:

* EBS volume remains in your AWS account.
* Storage charges continue until the volume is deleted manually.

---

# Billing Impact

### Running

* Compute charges apply.
* EBS storage charges apply.

### Stopped

* Compute charges stop.
* EBS storage charges continue.

### Terminated

* Compute charges stop.
* Default EBS volumes are deleted.
* Detached EBS volumes and unused Elastic IPs may still incur charges.

---

# Cost Optimization Tips

* Terminate unused EC2 instances.
* Delete unused EBS volumes.
* Release unused Elastic IP addresses.
* Remove unused snapshots.
* Use Auto Scaling where appropriate.
* Monitor costs with AWS Cost Explorer and Budgets.

---

# Common Issues

## Unable to Terminate Instance

Possible Cause:

* Termination Protection is enabled.

Solution:

* Disable Termination Protection.
* Retry the termination.

---

## EBS Volume Still Exists

Reason:

* **Delete on Termination** was disabled.

Solution:

* Review the data.
* Delete the volume manually if it is no longer needed.

---

## Elastic IP Still Appears

Reason:

* Elastic IPs are independent AWS resources.

Solution:

* Release the Elastic IP if it is no longer required.

---

## Instance Still Visible

Reason:

* AWS retains terminated instances in the console for a short period.

Solution:

* Refresh the page or filter the instance list.

---

# Best Practices

* Enable Termination Protection for production instances.
* Always verify backups before terminating.
* Create an AMI before deleting important servers.
* Review attached EBS volumes and snapshots.
* Tag resources for easier identification.
* Clean up unused resources to reduce costs.

---

# Verification Checklist

* [ ] EC2 Instance Selected
* [ ] Termination Protection Checked
* [ ] Important Data Backed Up
* [ ] EBS Volume Reviewed
* [ ] Instance Successfully Terminated
* [ ] Instance State = Terminated
* [ ] Billing Impact Understood
* [ ] Unused Resources Cleaned Up

---

# Interview Questions

### Q1. Can a terminated EC2 instance be restarted?

**Answer:** No. Once terminated, an EC2 instance cannot be started again. You must launch a new instance.

---

### Q2. What happens to the Public IP after termination?

**Answer:** The Public IPv4 address is released back to AWS and cannot be recovered.

---

### Q3. Does terminating an EC2 instance always delete the EBS volume?

**Answer:** No. The root EBS volume is deleted only if **Delete on Termination** is enabled. Otherwise, it is retained.

---

### Q4. What is Termination Protection?

**Answer:** It is an EC2 feature that prevents accidental deletion of an instance. It must be disabled before termination.

---

### Q5. Which AWS resources remain after terminating an EC2 instance?

**Answer:** Security Groups, Key Pairs, VPCs, Subnets, IAM Roles, and Elastic IPs (if not released) remain. EBS volumes may also remain if configured not to delete on termination.

---

# Key Takeaways

* **Stop** saves compute costs while preserving the instance.
* **Reboot** restarts the operating system without changing IP addresses.
* **Terminate** permanently deletes the EC2 instance.
* Always review attached resources before terminating.
* Use **Termination Protection** for critical production workloads.
* Clean up unused AWS resources to optimize costs.

---

# Task Completed Successfully ✅

Congratulations! 🎉

You have successfully completed the EC2 hands-on learning series.

You can now:

* Launch Linux and Windows EC2 instances
* Connect using SSH and RDP
* Understand the EC2 lifecycle
* Start, stop, and reboot instances
* Safely terminate EC2 instances
* Apply AWS security and cost optimization best practices

---

# 🚀 Next Learning Path

Continue your AWS journey with:

1. **Amazon EBS (Elastic Block Store)**
2. **Amazon AMI (Amazon Machine Image)**
3. **EC2 Security Groups**
4. **Elastic IP Addresses**
5. **EC2 User Data**
6. **IAM Roles for EC2**
7. **AWS Systems Manager (SSM)**
8. **EC2 Auto Scaling**
9. **Elastic Load Balancer (ELB)**
10. **Amazon CloudWatch for EC2 Monitoring**
