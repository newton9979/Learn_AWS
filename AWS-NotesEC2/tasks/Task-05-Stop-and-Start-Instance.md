# ⏯️ Task 05 - Stop, Start, Reboot, and Restart an EC2 Instance

## 🎯 Objective

Learn how to safely stop, start, reboot, and restart Amazon EC2 instances. Understand the differences between each action, their impact on billing, IP addresses, storage, and when each operation should be used.

---

# 📚 Learning Outcomes

After completing this task, you will be able to:

* Understand the EC2 instance lifecycle
* Stop and start an EC2 instance
* Reboot an EC2 instance
* Understand billing differences
* Identify changes to Public IP addresses
* Verify instance status after each operation
* Follow AWS best practices for instance management

---

# 📋 Prerequisites

Before starting, ensure you have:

* AWS Account
* One running EC2 instance (Linux or Windows)
* EC2 Console access
* Basic understanding of EC2 states

---

# EC2 Instance Lifecycle

```text
Pending
   │
   ▼
Running
   │
 ┌─┴───────────────┐
 │                 │
 ▼                 ▼
Reboot          Stop
 │                 │
 ▼                 ▼
Running       Stopped
                  │
                  ▼
               Start
                  │
                  ▼
               Running
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

Select your running EC2 instance.

---

# Step 2 — Stop the Instance

Click

```text
Instance State

↓

Stop Instance
```

Confirm the action.

AWS changes the state as follows:

```text
Running

↓

Stopping

↓

Stopped
```

Wait until the instance status becomes **Stopped**.

---

# Step 3 — Verify Instance Details

After stopping the instance, verify:

* Instance State = Stopped
* EBS Volume remains attached
* Private IP remains unchanged
* Public IPv4 Address may change after restart (unless using an Elastic IP)

---

# Step 4 — Start the Instance

Select the stopped instance.

Click

```text
Instance State

↓

Start Instance
```

AWS changes the state as follows:

```text
Stopped

↓

Pending

↓

Running
```

Wait until both status checks pass.

---

# Step 5 — Verify Public IP Address

After the instance starts:

Check:

* Public IPv4 Address
* Private IPv4 Address

**Note:**

* Public IP changes if an Elastic IP is not attached.
* Private IP remains the same within the VPC.

---

# Step 6 — Reboot the Instance

Select the running instance.

Click

```text
Instance State

↓

Reboot Instance
```

Confirm the reboot.

During reboot:

* Instance remains in **Running** state.
* Public IP does not change.
* Private IP remains the same.
* Data stored on EBS volumes remains intact.

---

# Step 7 — Verify Connectivity

Reconnect to your instance:

### Linux

```bash
ssh -i linux-key.pem ec2-user@PUBLIC-IP
```

### Windows

Use Remote Desktop (RDP) with the current Public IP.

Verify the instance is accessible after reboot.

---

# Step 8 — Verify System Uptime

### Linux

```bash
uptime
```

or

```bash
who -b
```

### Windows

Open **Task Manager → Performance** and verify system uptime.

---

# EC2 State Comparison

| Operation | Running State | Public IP  | Private IP | EBS Volume        | Billing                |
| --------- | ------------- | ---------- | ---------- | ----------------- | ---------------------- |
| Start     | Running       | May Change | Same       | Preserved         | Compute Charges Resume |
| Stop      | Stopped       | Released   | Same       | Preserved         | Compute Charges Stop   |
| Reboot    | Running       | Same       | Same       | Preserved         | Charges Continue       |
| Terminate | Terminated    | Released   | Deleted    | Deleted (Default) | Charges Stop           |

---

# Billing Impact

### Running

* Compute charges apply.
* Storage charges apply.

### Stopped

* No compute charges.
* EBS storage charges continue.

### Reboot

* Compute charges continue.
* No interruption in billing.

### Terminated

* Compute charges stop.
* EBS volumes are deleted by default unless **Delete on Termination** is disabled.

---

# Best Practices

* Stop instances when not in use to reduce compute costs.
* Use **Reboot** for minor operating system issues.
* Use **Stop/Start** for hardware migration or maintenance.
* Attach an **Elastic IP** if you need a permanent public IP.
* Always verify backups before terminating production instances.
* Monitor instance health using **Status Checks**.

---

# Common Issues

## Instance Stuck in Stopping

Possible Causes:

* Operating system is unresponsive.
* Hardware issue.

Solution:

* Use **Force Stop** from the EC2 Console if necessary.

---

## Public IP Changed

Reason:

* Instance was stopped and started without an Elastic IP.

Solution:

* Associate an Elastic IP to retain a fixed public IP.

---

## Unable to Connect After Start

Check:

* Security Group rules
* Network ACLs
* Public IP address
* SSH (Port 22) or RDP (Port 3389)
* Instance Status Checks

---

# Verification Checklist

* [ ] EC2 Instance Running
* [ ] Instance Successfully Stopped
* [ ] Instance Successfully Started
* [ ] Reboot Completed
* [ ] Public IP Verified
* [ ] Private IP Verified
* [ ] Successfully Reconnected
* [ ] System Uptime Verified

---

# Interview Questions

### Q1. Does stopping an EC2 instance stop billing?

**Answer:** Compute charges stop, but EBS storage charges continue.

---

### Q2. Does rebooting an EC2 instance change the Public IP?

**Answer:** No. A reboot does not change the Public or Private IP addresses.

---

### Q3. What happens to the Public IP after stopping and starting an EC2 instance?

**Answer:** The Public IP may change unless an Elastic IP is associated with the instance.

---

### Q4. Does stopping an EC2 instance delete the EBS volume?

**Answer:** No. The EBS volume remains attached and all stored data is preserved.

---

### Q5. When should you use Reboot instead of Stop/Start?

**Answer:** Use **Reboot** for operating system updates or minor issues where hardware migration is not required. Use **Stop/Start** when you need to move the instance to different underlying hardware or perform maintenance.

---

# Task Completed Successfully ✅

You have successfully:

* Stopped an EC2 instance
* Started the instance again
* Rebooted the instance
* Verified IP address behavior
* Understood billing implications
* Learned AWS EC2 lifecycle management
* Followed EC2 management best practices

---

## 📌 Next Task

➡️ **Task-06-Terminate-Instance.md**

In the next task, you will learn how to safely terminate an EC2 instance, understand what resources are deleted or retained, explore termination protection, and review cost optimization best practices.
