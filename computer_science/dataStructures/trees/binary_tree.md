**Binary Tree** is a tree where each node can have only two children at most.

## Binary Search Tree

**Binary search tree** is a binary tree where its right child is always bigger than its parent and left child is always smaller than its parent.

This organization ensures that insertions and searching will be as fast as `O(logn)` until bst is in the unbalanced state:

![[balanced:unbalanced_bst.png]]

In unbalanced state bst's insertion and searching has `O(n)` time complexity.

### Traversing

- Inorder: `left` then `root` then `right`
- Preorder: `root` then `left` then `right`
- Postorder: `left` then `right` then `root`
