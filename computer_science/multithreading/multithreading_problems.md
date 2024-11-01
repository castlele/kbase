---
tags:
  - multithreading
  - threads
  - pthreads
  - cs
---

## Deadlock

This problem ofter occurs when two or move threads have stopped execution or are spinning permanently.

For example, if thread 1 locks A and thread 2 locks B, thread 1 wants to lock B and thread 2 wants to lock A. Instant deadlock. Also, deadlock can occur when mutex doesn't unlock properly.

## Race Condition

Occurs when multiple threads access shared data without proper synchronization. This can lead to undefined behaviour.

## Priority Inversion

Occurs when higher priority thread can wait behind a lower priority thread if the lower priority thread holds a lock for which the higher priority thread is waiting. This can be eliminated by limiting the number of shared mutexes between different priority threads.
