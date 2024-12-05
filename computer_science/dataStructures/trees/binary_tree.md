**Binary Tree** is a tree where each node can have only two children at most.

## Binary Search Tree

**Binary search tree** is a binary tree where its right child is always bigger than its parent and left child is always smaller than its parent.

This organization ensures that insertions and searching will be as fast as `O(logn)` until bst is in the unbalanced state:

![[balanced:unbalanced_bst.png]]

In unbalanced state bst's insertion and searching has `O(n)` time complexity.

### Traversing

**DFS** (Depth-First search): explores a path all the way down to the leaf before backtracking and exploring another path.

![[DFS.png]]
The result for this algorithm will be 1–2–3–4–5–6–7

Types of **DFS**:
- Inorder: `left` then `root` then `right`
- Preorder: `root` then `left` then `right`
- Postorder: `left` then `right` then `root`

**BFS** (Breadth-First search): explores the tree level by level.

![[BFS.png]]
So we traverse level by level. In this example, the result is 1–2–5–3–4–6–7
