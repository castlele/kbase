---
tags:
  - MIFI
  - linux
  - devops
  - RAID
---
**RAID (Redundant Array of Independent Disks)** - a technology of fault-tolerant storage that can combine multiple physical disks in one logical system. Fault-tolerance is an important aspect in securing data and increasing performance of the disk subsystem.

## RAID Levels of Specification

### RAID 0 (Stripe mode)

This is a disk array of two or more disks with *super* fast read/write operations. Information will be splitted in peaces of fixed same size by the number of disks and read/write operation will go in parallel on every disk simultaneously.

![img](https://lms.skillfactory.ru/asset-v1:SkillFactory+MIFIDEV+SEP2024+type@asset+block@MIFIDEV_3.1.png)

So, if read/write on one disk passes in 10 seconds, on RAID 0 with 5 disks this operation will took 2 seconds. And this is the main advantage of stripe mode. It increases data processing.

However, it isn't very fault-tolerant. If one disk is broken the hole array will stop functioning.

### RAID 1 (mirroring)

This is an array of two disks which are the copies of each other. Each time data is witten on RAID 1 it writes on every disk. This means that storage of the collection equals to storage of one disk. If one disk has less storage than another, RAID will have capacity of the smallest one.

![img](https://lms.skillfactory.ru/asset-v1:SkillFactory+MIFIDEV+SEP2024+type@asset+block@MIFIDEV__3.2.png)

Reading in this paradigm is pretty fast, because data is read from the both disks simultaneously. On the other hand the writing is quite slow.

### RAID 5

This mode is used in cases, when it is required to unit a lot of physical disks. 

![img](https://lms.skillfactory.ru/asset-v1:SkillFactory+MIFIDEV+SEP2024+type@asset+block@MIFIDEV__3.3.png)

Performance of read and write is increased. If one disk go out of order the system can still work and the user won't lose his data. But if two disks go out of order the hole system become broken and all data is lost.

### RAID 10

This mode is a combination of RAID-1s and RAID-0s.

![img](https://lms.skillfactory.ru/asset-v1:SkillFactory+MIFIDEV+SEP2024+type@asset+block@MIFIDEV_3.4.png)

An array in this mode is splitted in to mirror parts horizontally. This greatly increases performance of reading, buy writing is decreases.

---

There are other RAID levels:
1. RAID 2
2. RAID 3 and 4
3. RAID 6
4. RAID 50
5. RAID 60