# homelab-k8s-gitops

- [K3S Cluster](docs/k8s-commands.md)
- Longhorn Block Storage
- [Flux for GitOps](https://fluxcd.io/)
- [SOPS for Secrets](https://fluxcd.io/flux/guides/mozilla-sops/)
- [Monorepo structure](https://fluxcd.io/flux/guides/repository-structure/)
- [Slack Notifications](https://fluxcd.io/flux/guides/notifications/)
- [Flux Variable substitution](https://fluxcd.io/flux/components/kustomize/kustomization/#variable-substitution)

# Staging Environment
## Staging - HW
Intel I5 platform x 1 
## Staging - HW Virtualization
Proxmox VM 
- 8 CPU
- 12G RAM
- 20G DISK
- Ubuntu 22.04.1 LTS
## Staging - Cluster Setup
Single K3S Master node, no agent nodes
- Disable service loadbalancer at install time - Metallb will be installed later(see infrastructure)
- Disable ingress controller at install time - Traefik will be installed later(see infrastructure) 

```bash
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--disable servicelb --disable traefik" sh -
```

Install prerequisites on host
```bash
# Install age encryption tool 
$ sudo apt install age

# Install Mozilla's SOPS CLI tool
$ wget https://github.com/mozilla/sops/releases/download/v3.7.3/sops_3.7.3_amd64.deb
$ sudo dpkg -i ./sops_3.7.3_amd64.deb
```
## Staging - Cluster Sources
- All flux HelmRepository charts are moved out to separate folder so we can use "DependsOn".
## Staging - Cluster Infrastructure
- Service Load Balancer - Metallb
    - Using dynix raw helm chart to wrap metallb L2 post config i.e. config should be applied after metallb is installed.
    - [Inspiration](https://www.youtube.com/watch?v=zNbqxPRTjFg&t=474s)
    - [Inspiration - check if Metallb is working as expected](https://youtu.be/dEAtD9PVr_Q?t=477)
- Ingress Controller - Traefik
    - Pre-req: Service load balacing in place i.e. Metallb
    - [Inspiration](https://www.youtube.com/watch?v=G4CmbYL9UPg&t=907s)
- Certificates - Let's encrypt/Cloudflare
    - [Inspiration - repo setup](https://github.com/onedr0p/flux-cluster-template/tree/main/cluster/apps/networking/cert-manager)
    - [Inspiration - youtube](https://www.youtube.com/watch?v=G4CmbYL9UPg&t=907s)
    - Use ENV i.e. [variable substitution](https://fluxcd.io/flux/components/kustomize/kustomization/#variable-substitution)
- Slack Notification

- Block storage - Longhorn



- MongoDB - need to revised

## Staging - Cluster APPs
- Test app - Nginx

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
- Block storage - Longhorn
```bash
# Taint and label Storage Nodes 
kubectl taint nodes k3s-longhorn-1 k3s-longhorn-2 k3s-longhorn-3 CriticalAddonsOnly=true:NoExecute

kubectl label nodes k3s-longhorn-1 k3s-longhorn-2 k3s-longhorn-3 disktype=ssd
```

## Production - Cluster APPs

# Restoration
[How to restore my cluster from scratch](docs/restoration.md)