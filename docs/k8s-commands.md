# Kubernetes commands

```bash
# List all pods 
kubectl get pods --all-namespaces -o wide

# List of taints per node
kubectl get nodes -o json | jq '.items[].spec.taints'
```

# Certificates
```bash
# List any 'Certificate' resources  
kubectl get Issuers,ClusterIssuers,Certificates,CertificateRequests,Orders,Challenges --all-namespaces

# Get challenges info
kubectl get challenges
kubectl describe orders.acme.cert-manager.io local-live-wpqp7-2112207529
```

