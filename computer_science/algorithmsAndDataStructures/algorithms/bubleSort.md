# Buble Sort

Sorting algoritm that works by repeatedly swapping the adjacent elements if
they are in the wrong order. 

**Complecity:** $O(n^2)$

**Space complecity:** $O(1)$

## How It Works

1. Iterate the array comparing two adjacent elements and placing them in the
   right order (for example, ascending) by swapping them if needed.
2. On the first iteration the largest element will be at the end of the array.
3. This process is then continued to place other elements in order

![Buble sort for stupid](/computer_science/res/buble_sort.jpg)

## Pros and Cons

- ✅ so simple, so it can be understanded by everyone
- ✅ optimal performance on small arrays with no requirement for additional
memory space
- ⛔ algorimth has very slow performance on large amount of data because of the
time complecity of $O(n^2)$
