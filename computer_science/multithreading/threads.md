---
tags:
  - multithreading
  - threads
  - pthreads
  - cs
  - mutex
---
[article](https://randu.org/tutorials/threads/)

## Threads

**Thread** is a "procedure" that runs independently from its main program. So, it is an independent stream of instructions that can be schedules to run as such by the operating system.

Processes are created by the operating system and contain information about program resources and program execution state:

- identifying information (e.g. process ID and user ID)
- environment variables
- working directory
- program instructions
- CPU state (e.g. registers, fault info)
- memory allocation (stack and heap)
- file descriptors
- signal actions
- shared libraries
- inter-process communication related information (such as message queues, pipes, semaphores or shared momory)

![Process caption="TEST"](https://hpc-tutorials.llnl.gov/posix/images/process.gif)
![Threads caption="TEST2"](https://hpc-tutorials.llnl.gov/posix/images/thread.gif)

As seen from the pictures threads exist within a process resources and still able to be scheduled by the operation system and run as independent entities. To achieve this, threads holds only the bare minimum of resources that enable them to exist as executable code, such as:

- stack pointer
- registers
- scheduling properties (such as policy or priority)
- set of pending and blocked signals
- thread-specific data

Because threads within the same process share resources:
- changes made by one thread to shared system resources  (such as closing a file) will be seen by all other threads
- two pointers having the same value point to the same data
- reading and writing to the same memory locations is possible, and therefore requires explicit synchronization by the programmer

## Thread Design Patterns

**Manager/worker** [[worker]]: a single-threaded manager assigns work to other threads, the workers. Typically, the manager handles all input and parcels out work to the other tasks. At least two forms of the manager/worker model are common: static worker pool and dynamic worker pool

**Peer** [[workcrew]]: similar to the manager/worker model, but after the  main thread creates other threads, it participates in the work

Pipeline [[pipeline]]: a task is broken into a series of suboperations, each of which is handled in sequence, but concurrently, by a different thread. An automobile assemble line best describes this model

# Protecting Shared Resources

**Mutual exclusion (взаимное исключение) or mutex** is the method of serializing access to shared resources.

In multithreading environment *race condition* can occur if multiple threads try to write the save resource at the same time or if one thread is writing and another is reading can lead to reading an old data. To prevent this mutex is used. If thread is using some resource, mutex locks this data from being read or write from other threads until thread stops using the data and unlocks the mutex.

**Mutex types:**
- *Recursive:* allows to lock the same lock again from one thread
- *Queuing:* allows fairness in lock aquisition by providing FIFO ordering on the arrival of lock requests. Such mutexes may be slower
- *Reader/Writer:* allows for multiple readers to acquire the lock simultaneously. No writers will be allowed while all readers unlock the lock. This can lead to writer starvation.
- *Scoped:* [some staff I don't understand right now](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization)

## Potential Problems with Mutexes

![[multithreading_problems#Deadlock]]

![[multithreading_problems#Race Condition]]

![[multithreading_problems#Priority Inversion]]

## Thread Synchronization Primitives

**Join:** Collecting of all relevant threads at a logical synchronization point.

**Condition Variables:**

![cv](https://randu.org/tutorials/threads/images/condition_wait.png)

**Barriers:**
Makes sure that all threads in the barrier will wait until all threads have called the said barrier method.

**Spinlocks:**
This is a lock that causes thread trying to acquire it to simple wait in a loop while repeatedly checking whether the lock is available. Its advantage is that the waiting thread doesn't go into sleeping mode.

**Semaphores:**
Semaphores can be binary and counting. Binary can be seen as a regular simple mutex, while counting is like a recursive mutex. Counting semaphores can be initialized to any arbitrary value which should depend on how many resources you have available for that particular shared data. Many threads can obtain the lock simultaneously until the limit is reached. This is referred to a *lock depth*.

Semaphores usually used in multiprocess programming (i.e. it's used as a synch primitive between processes.)