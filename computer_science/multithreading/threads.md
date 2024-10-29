---
tags:
  - multithreading
  - threads
  - pthreads
  - cs
  - mutex
---
[article](https://randu.org/tutorials/threads/)

## Thread Design Patterns

**Thread Pool** [[worker]]

**Peer** [[workcrew]]

Pipeline [[pipeline]]

# Protecting Shared Resources

**Mutual exclusion (взаимное исключение) or mutex** is the method of serializing access to shared resources.

In multithreading environment *race condition* can occur if multiple threads try to write the save resource at the same time or if one thread is writing and another is reading can lead to reading an old data. To prevent this mutex is used. If thread is using some resource, mutex locks this data from being read or write from other threads until thread stops using the data and unlocks the mutex.

**Mutex types:**
- *Recursive:* allows to lock the same lock again from one thread
- *Queuing:* allows fairness in lock aquisition by providing FIFO ordering on the arrival of lock requests. Such mutexes may be slover
- *Reader/Writer:* allows for multiple readers to acquire the lock simultaneously. No writers will be allowed while all readers unlock the lock. This can lead to writer starvation.
- *Scoped:* [some staff I don't understand right now](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization)

## Potential Problems with Mutexes

![[multithreading_problems#Deadlock]]

![[multithreading_problems#Race Condition]]

![[multithreading_problems#Priority Inversion]]

## Thread Synchronization Primitives

**Join:**

**Condition Variables:**

**Barriers:**

**Spinlocks:**

**Semaphores:**
