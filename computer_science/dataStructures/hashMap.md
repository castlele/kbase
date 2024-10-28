---
tags:
  - datastructures
  - cs
---
**Hash map** is a data structure that holds its data in key/value pairs persisting random access to each element.

![video](https://www.youtube.com/watch?v=h2d9b_nEzoA)

All the magic comes from the special **has function** that translates an element into the index and stores the this element by the generated index in the normal array!

Unfortunately, hash function can return the same index for different elements. This called a **collision**. There are multiple methods of resolving collisions: *linear probing* and *separate chaining*.

With *linear probing* new element that hashes to the occupied index it will take the next free slot in the table.

![[Pasted image 20241028065040.png]]

With linear probing the chance of the repeated collision is significant. This is called **clustering**. Also, insertion and reading is `O(n)`

On the other hand, the *separate chaining* offers a more convenient solution. With this collision resolution method the hash table is actually a table of linked lists. So, every time a collision occurs new element is places to the head of linked list at a constant time. This gives us a time complexity of reading and writing `O(n/k)`, where `n` is the length of the linked list and k is the length of the hash table. Unfortunately, if the size of the hash table is constants the time complexity is still `O(n)`. However, this is still a major improvement in the performance!

![[Pasted image 20241028065725.png]]

**Properties of a good hash function:**

1. Makes use of all info provided by the key
2. Uniformly distributes output across table
3. Maps similar keys to very different hash values
4. Uses only very fact operations