# Amazon EBS Snapshots

## What is an EBS Snapshot?

An EBS Snapshot is a point-in-time backup of an Amazon EBS volume.

Snapshots help protect data from accidental deletion, corruption, or infrastructure failures. AWS stores snapshots automatically in Amazon S3 (managed by AWS).

### Key Benefits

* Backup and Recovery
* Disaster Recovery (DR)
* Volume Cloning
* Migration between Availability Zones
* Migration between AWS Regions

---

## How EBS Snapshots Work

```text
EBS Volume
     |
     v
Create Snapshot
     |
     v
Snapshot Stored by AWS
     |
     v
Create New EBS Volume
```

A snapshot captures the current state of an EBS volume and allows you to restore it later.

---

## Example

Suppose an EC2 instance has a 100 GB EBS volume:

```text
EC2 Instance
      |
      +-- EBS Volume (100 GB)
              |
              +-- Application Data
              +-- Logs
              +-- Database Files
```

Before making major changes, create a snapshot.

```text
EBS Volume
      |
      +-- Create Snapshot
              |
              +-- Snapshot Backup
```

If something goes wrong, create a new volume from the snapshot and attach it to the EC2 instance.

---

## Incremental Snapshots

EBS Snapshots are incremental.

### First Snapshot

```text
Volume Data = 100 GB

Snapshot-1
Stores 100 GB
```

### Second Snapshot

Only changed blocks are stored.

```text
Changed Data = 10 GB

Snapshot-2
Stores only 10 GB
```

Benefits:

* Lower storage cost
* Faster backup operations
* Efficient storage management

---

## Snapshot Restore Process

```text
EBS Volume
      |
      v
Snapshot
      |
      v
New EBS Volume
      |
      v
Attach to EC2
```

This process is commonly used for disaster recovery and migration.

---

## Moving Volumes Across Availability Zones

EBS volumes are AZ-specific.

Example:

```text
ap-south-1a
    |
    +-- EBS Volume
```

To use the volume in another AZ:

```text
EBS Volume
      |
Create Snapshot
      |
Create New Volume
      |
Attach in ap-south-1b
```

---

## Copying Snapshots Across Regions

Example:

```text
Mumbai Region
      |
      v
Snapshot
      |
Copy Snapshot
      |
      v
Singapore Region
```

Useful for:

* Disaster Recovery
* Compliance
* Global Deployments

---

## Best Practices

* Schedule regular snapshots.
* Use tags for organization.
* Keep snapshots before major upgrades.
* Copy critical snapshots to another region.
* Delete unused snapshots to reduce cost.

---

## SAP-C03 Exam Tips

Remember:

* EBS Volumes are Availability Zone specific.
* Snapshots are Regional resources.
* Snapshots are incremental.
* Snapshots can be copied across Regions.
* New EBS volumes can be created from snapshots.

---

## Interview Questions

### Q1: What is an EBS Snapshot?

A point-in-time backup of an EBS volume.

### Q2: Are EBS Snapshots full backups?

The first snapshot is full; subsequent snapshots are incremental.

### Q3: Can a snapshot be copied to another Region?

Yes.

### Q4: Can you create a new EBS volume from a snapshot?

Yes.

### Q5: Why are snapshots important?

They provide backup, recovery, migration, and disaster recovery capabilities.

---

## Quick Revision

```text
EBS Volume
    |
    +-- Snapshot (Backup)
            |
            +-- Create New Volume
                    |
                    +-- Attach to EC2
```

Key Points:

✓ Point-in-time backup

✓ Incremental storage

✓ Stored by AWS

✓ Supports disaster recovery

✓ Can create new volumes

✓ Can be copied across regions

