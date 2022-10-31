# homelab-k8s-gitops

- K3S Cluster
- Longhorn Block Storage
- Flux for GitOps
- SOPS for Secrets 

# Staging Environment
## Staging - HW
Intel I5 platform x 1 
## Staging - HW Virtualization
Proxmox VM 
- 8 CPU
- 12G RAM
- 20G DISK
## Staging - Cluster Setup
Single K3S Master node, no agent nodes

```bash
$ curl -sfL https://get.k3s.io | sh -
```
## Staging - Cluster Infrastructure

## Staging - Cluster APPs

# Production Environment
## Production - HW
Intel I5 platform x 5
## Production - HW Virtualization
- 3 Proxmox VMs as Master Nodes
- 3 Proxmox VMs as Agent Nodes
- 3 Proxmox VMs with SSD as Storage Nodes

## Production - Cluster Setup
Ansible manage
## Production - Cluster Infrastructure

## Production - Cluster APPs