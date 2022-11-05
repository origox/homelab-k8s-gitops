# homelab-k8s-gitops

- K3S Cluster
- Longhorn Block Storage
- [Flux for GitOps](https://fluxcd.io/)
- [SOPS for Secrets](https://fluxcd.io/flux/guides/mozilla-sops/) 

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
k3s-master$ curl -sfL https://get.k3s.io | sh -
```

Install prerequisites on host
```bash
$ sudo apt install gnupg # try out age...
$ wget https://github.com/mozilla/sops/releases/download/v3.7.3/sops_3.7.3_amd64.deb
$ sudo dpkg -i ./sops_XYZ.deb

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