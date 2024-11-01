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