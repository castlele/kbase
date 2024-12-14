---
tags:
  - devops
  - clasterization
  - k8s
---
## K8s Architecture

### Hardware Components

**Nodes** are the smallest unit of hardware in k8s. It is a representation of a single machine in the cluster. A node is a physical machine in a data center or virtual machine hosted on a cloud, like Google Cloud Platform.

![[k8s_nodes.png]]

**Cluster** is a nodes combined in together to form a powerful machine. All nodes combine their resources. K8s doesn't work with individual nodes.

**Persistent Volumes** to store data.

### Software Components

**Containers** are a self-contained environment where applications are executed.

**Pods** are groups of containers deployed together on the same host. Pods provide two different types of shared resources: networking and storage.

**Deployment** is a set of identical pods. It runs multiple replicas of the application and if in case an instance fails, deployment replaces those instances. Pods can't be launched on a cluster directly, instead, they are managed by one more layer of abstraction.

**Ingress** is a collection of routing rules that decide how the external services access the services running inside k8s clusters. Ingress provides load balancing, SSL termination and name-based virtual hosting.

![[k8s_architecture.png]]