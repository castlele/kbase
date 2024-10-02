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

![img](https://lms.skillfactory.ru/asset-v1:SkillFactory+MIFIDEV+SEP2024+type@asset+block@MIFIDEV__3.2.png)