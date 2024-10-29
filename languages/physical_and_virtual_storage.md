---
tags:
  - MIFI
  - CS
  - storage
  - JVM
---
Next topic: [[data_streams]]

## Physical and Virtual Storage

**Physical computer storage** - a set of physical cells. In this cells data and instructions needed for working of the programs are stored. Every cell has its own unique address with which data in the cell can be accessed with read/write operations.

**Virtual storage** - a technology, that allows to use more storage that a physical storage has. This works by using virtual addressed. Addressed are used by programs, but the data itself is stored on the physical storage (RAM or hard drive). For realization mechanism of tables of pages and mapping is used.

**Tables of pages** - structure of data, that compares virtual and physical addresses. When program accesses a virtual address, *OS* checks table of pages to find corresponding physical address. If needed data page is missing on the physical storage, *OS* downloads it from the virtual storage on the physical storage.

**Mapping** - matching process of virtual addresses to physical ones. Matching is made by OS on downloading of the program into the memory. Every program has its own space in the virtual memory divided into pages. OS guarantees that programs can safely work in their own memory space and don't affect other programs.

## Abstraction of the Virtual Storage

**JVM** uses multiple types of storages: stack and heap. If heap becomes overflowing JVM can use virtual memory for temporary memory storage. However, this can decrease performance, because access to the data on the hard drive is much slower than to RAM.

### How RAM works

When process request access to the certain memory space, OS transforms this request from virtual address to the physical address by table of pages.

1. If requested data is stored in RAM access to it occurs straight away.
2. If there is no data in RAM, **page fault** occurs. OS downloads data from the hard drive into the RAM and transfers control to the process.
3. If physical data hasn't enough space, OS uses algorithm of page paging to determine what pages can be unloaded from the drive to free up the space on the RAM.

## Buffer in Abstraction of the Virtual Storage

**Buffer** is a temporary memory storage that is used in data transfering and processing.