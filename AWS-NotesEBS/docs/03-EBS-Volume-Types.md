# 📀 03 - Amazon EBS Volume Types

## 📖 Introduction

Amazon Elastic Block Store (EBS) provides different volume types designed for various workloads. Each volume type offers a unique balance of performance, cost, and durability.

Choosing the correct EBS volume type is essential for optimizing application performance while controlling AWS costs.

---

# 📌 Why Multiple Volume Types?

Different applications have different storage requirements.

For example:

- A web server requires balanced performance.
- A production database needs high IOPS and low latency.
- A backup server requires high throughput.
- An archive server prioritizes low cost over performance.

To satisfy these requirements, AWS offers multiple EBS volume types.

---

# 📀 Amazon EBS Volume Types

Amazon EBS volumes are divided into two major categories.

## 1️⃣ SSD (Solid State Drive)

Best for:

- Operating Systems
- Boot Volumes
- Databases
- DevOps Servers
- Low Latency Applications
- Virtual Machines

Volume Types:

- gp3 (General Purpose SSD)
- gp2 (General Purpose SSD - Previous Generation)
- io2 (Provisioned IOPS SSD)
- io1 (Provisioned IOPS SSD - Previous Generation)

---

## 2️⃣ HDD (Hard Disk Drive)

Best for:

- File Servers
- Big Data
- Log Storage
- Backups
- Sequential Read/Write Workloads

Volume Types:

- st1 (Throughput Optimized HDD)
- sc1 (Cold HDD)

---

# 📊 Volume Type Comparison

| Volume Type | Storage | Best For | Performance | Cost |
|-------------|----------|----------|-------------|------|
| gp3 | SSD | General Purpose | ⭐⭐⭐⭐ | $$ |
| gp2 | SSD | Legacy Workloads | ⭐⭐⭐ | $$ |
| io2 | SSD | Mission Critical Databases | ⭐⭐⭐⭐⭐ | $$$$ |
| io1 | SSD | Older High IOPS Workloads | ⭐⭐⭐⭐ | $$$ |
| st1 | HDD | Big Data & Streaming | ⭐⭐⭐ | $ |
| sc1 | HDD | Archive & Cold Storage | ⭐⭐ | Lowest |

---

# 🔹 gp3 (General Purpose SSD)

## Best For

- Linux Servers
- Windows Servers
- Web Applications
- Application Servers
- Development Environments
- Production Workloads

### Features

- Latest General Purpose SSD
- High Performance
- Independent IOPS & Throughput Configuration
- Lower Cost than gp2
- Recommended by AWS

### Maximum Performance

- Up to 16,000 IOPS
- Up to 1,000 MB/s Throughput

---

# 🔹 gp2 (General Purpose SSD)

Older generation SSD.

### Features

- Performance depends on volume size
- Uses Burst Credits
- Less flexible than gp3

AWS recommends using gp3 for new workloads.

---

# 🔹 io2 (Provisioned IOPS SSD)

Designed for mission-critical applications.

Best For

- Oracle Database
- Microsoft SQL Server
- SAP HANA
- Financial Applications
- Banking Systems

Features

- Extremely Low Latency
- Highest Durability
- Consistent Performance
- Very High IOPS

---

# 🔹 io1 (Provisioned IOPS SSD)

Previous generation of io2.

Mostly used by older applications.

AWS recommends io2 for new deployments.

---

# 🔹 st1 (Throughput Optimized HDD)

Best For

- Hadoop
- Kafka
- Data Warehouses
- Log Processing
- Streaming Applications

Features

- High Throughput
- Sequential Read/Write
- Lower Cost than SSD

Not recommended for boot volumes.

---

# 🔹 sc1 (Cold HDD)

Lowest-cost EBS volume.

Best For

- Archives
- Backups
- Cold Data
- Long-Term Storage

Features

- Lowest Performance
- Lowest Cost

Not suitable for production databases.

---

# 🎯 Which Volume Should You Choose?

| Workload | Recommended Volume |
|-----------|-------------------|
| EC2 Boot Volume | gp3 |
| Linux Server | gp3 |
| Windows Server | gp3 |
| Production Database | io2 |
| SAP HANA | io2 |
| Oracle Database | io2 |
| SQL Server | io2 |
| Hadoop | st1 |
| Kafka | st1 |
| Backup Server | sc1 |
| Archive Storage | sc1 |

---

# 💡 AWS Recommendation

For most new workloads, AWS recommends **gp3** because it offers:

- Better performance
- Lower cost
- Configurable IOPS
- Configurable throughput
- No dependency on volume size

---

# 📝 Interview Questions

### 1. Which EBS volume type is recommended by AWS?

**Answer:** gp3

---

### 2. Which volume is best for Oracle Database?

**Answer:** io2

---

### 3. Which volume type is cheapest?

**Answer:** sc1

---

### 4. Which volume is used for Big Data?

**Answer:** st1

---

### 5. Which EBS volume is best for boot volumes?

**Answer:** gp3

---

# 📚 Summary

- SSD volumes are designed for low latency and high performance.
- HDD volumes are optimized for throughput and cost.
- gp3 is the default choice for most workloads.
- io2 is ideal for critical databases.
- st1 is suited for big data processing.
- sc1 is intended for archive and cold storage.
