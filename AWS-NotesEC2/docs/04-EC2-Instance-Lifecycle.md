# 04 – Amazon EC2 Instance Lifecycle

## 🎯 Objective

Understanding the EC2 instance lifecycle is essential for managing compute resources efficiently. This chapter explains each instance state, what happens during transitions, billing behavior, and best practices.

---

# What is an EC2 Instance Lifecycle?

An EC2 instance passes through several states from creation until termination. Each state represents the current status of the virtual machine.

```
Pending
   │
   ▼
Running
   │
   ├────────► Rebooting
   │             │
   │             ▼
   ├────────── Running
   │
   ├────────► Stopping
   │             │
   │             ▼
   ├────────── Stopped
   │             │
   │             ▼
   └────────► Starting
                 │
                 ▼
              Running

Running
   │
   ▼
Shutting-down
   │
   ▼
Terminated
```

---

# EC2 Instance States

| State         | Description                      | Charges                      |
| ------------- | -------------------------------- | ---------------------------- |
| Pending       | Instance is being launched       | Yes                          |
| Running       | Instance is active and available | Yes                          |
| Rebooting     | Operating system is restarting   | Yes                          |
| Stopping      | Instance is shutting down        | No (except attached storage) |
| Stopped       | Instance is powered off          | No compute charges           |
| Starting      | Instance is starting again       | Yes                          |
| Shutting-down | Instance is being terminated     | No                           |
| Terminated    | Instance is permanently deleted  | No                           |

---

# 1. Pending State

The instance enters the **Pending** state immediately after you click **Launch Instance**.

### AWS performs the following tasks:

* Allocates compute resources
* Attaches EBS volume
* Configures networking
* Applies Security Groups
* Assigns an IP address
* Boots the operating system

Once complete, the instance automatically moves to **Running**.

---

# 2. Running State

The instance is fully operational.

You can:

* Connect using SSH or RDP
* Install software
* Run applications
* Transfer files
* Monitor performance

**Billing:** Compute charges apply while the instance is running.

---

# 3. Rebooting

A reboot restarts the operating system without moving the instance to another host.

You can reboot:

* From the AWS Console
* Using the AWS CLI
* From within the operating system

### What remains unchanged?

* Instance ID
* Private IP
* Public Elastic IP (if attached)
* EBS volumes

**Billing:** Continues during reboot.

---

# 4. Stopping

When you stop an EC2 instance:

* The operating system shuts down safely.
* Compute resources are released.
* The instance moves to the **Stopped** state.

This option is available only for **EBS-backed** instances.

---

# 5. Stopped

The instance is powered off.

### What is preserved?

* Instance ID
* Attached EBS volumes
* Security Groups
* IAM Role
* Private IP address

### What may change?

* Public IPv4 address (unless using an Elastic IP)

**Billing:**

* No compute charges
* Storage charges for EBS volumes still apply

---

# 6. Starting

When you start a stopped instance:

* AWS allocates new compute resources.
* The operating system boots.
* Services become available.

The instance returns to the **Running** state.

---

# 7. Shutting-down

This state appears after you choose **Terminate Instance**.

AWS begins deleting the instance.

During this phase:

* New connections are not accepted.
* The termination process cannot usually be canceled.

---

# 8. Terminated

The instance has been permanently deleted.

### What is removed?

* Virtual machine
* Temporary storage (Instance Store)
* Public IP address
* Compute resources

### What may remain?

* EBS volumes (if **Delete on Termination** is disabled)
* Snapshots
* AMIs
* Elastic IP (if not released)

A terminated instance cannot be restarted.

---

# Stop vs Reboot vs Terminate

| Feature              | Reboot | Stop | Terminate                        |
| -------------------- | ------ | ---- | -------------------------------- |
| Restart OS           | ✅      | ❌    | ❌                                |
| Instance Deleted     | ❌      | ❌    | ✅                                |
| Instance ID Changes  | ❌      | ❌    | N/A                              |
| EBS Volume Preserved | ✅      | ✅    | Depends on Delete on Termination |
| Public IP May Change | ❌      | ✅    | Yes                              |
| Compute Charges Stop | ❌      | ✅    | ✅                                |

---

# Billing Summary

| Instance State | Compute Charges |
| -------------- | --------------- |
| Pending        | Yes             |
| Running        | Yes             |
| Rebooting      | Yes             |
| Starting       | Yes             |
| Stopping       | No              |
| Stopped        | No              |
| Shutting-down  | No              |
| Terminated     | No              |

> **Note:** Even when an instance is stopped, attached EBS volumes, snapshots, and Elastic IPs (if applicable) may still incur charges.

---

# Best Practices

* Stop unused instances to reduce compute costs.
* Terminate instances that are no longer needed.
* Take EBS snapshots before terminating important servers.
* Use Elastic IPs if you need a persistent public IP address.
* Enable detailed monitoring for production workloads.
* Tag instances for easier management and cost tracking.

---

# Common Interview Questions

### Q1. Can a terminated EC2 instance be restarted?

**Answer:** No. A terminated instance is permanently deleted.

---

### Q2. Does stopping an instance delete its EBS volume?

**Answer:** No. The EBS volume remains attached unless it is explicitly deleted.

---

### Q3. What happens to the public IP after stopping an instance?

**Answer:** The public IPv4 address is released unless an Elastic IP is associated with the instance.

---

### Q4. Are you charged when an instance is stopped?

**Answer:** There are no compute charges, but storage resources such as EBS volumes continue to incur charges.

---

### Q5. Which lifecycle state allows users to connect to the instance?

**Answer:** **Running**

---

# Key Takeaways

* EC2 instances move through multiple lifecycle states.
* Only the **Running** state allows normal user access.
* **Stopping** saves costs by stopping compute billing.
* **Terminating** permanently deletes the instance.
* EBS storage is billed separately from compute resources.

---

## Summary

In this chapter, you learned:

* EC2 lifecycle states
* What happens in each state
* Billing behavior
* Difference between Reboot, Stop, and Terminate
* Best practices for managing EC2 instances
* Common interview questions

➡️ **Next Chapter:** `05-Linux-vs-Windows-EC2.md`
