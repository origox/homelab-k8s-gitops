# Kubernetes commands
```bash
# List all pods 
kubectl get pods --all-namespaces -o wide

# List of taints per node
kubectl get nodes -o json | jq '.items[].spec.taints'

# List all pods for a specific node
kubectl get pods --field-selector spec.nodeName=k3s-server-1 -A
```

# Kubectl
```bash
# Merge kubectl config files
cp ~/.kube/config ~/.kube/config.bak && KUBECONFIG=~/.kube/config:/path/to/new/config kubectl config view --flatten > /tmp/config && mv /tmp/config ~/.kube/config
```


# Certificates
```bash
# List any 'Certificate' resources  
kubectl get Issuers,ClusterIssuers,Certificates,CertificateRequests,Orders,Challenges --all-namespaces

# Get challenges info
kubectl get challenges
kubectl describe orders.acme.cert-manager.io local-live-wpqp7-2112207529
```

# Create secrets
```bash
# First step is to create ordinary base64 encoded secret  
kubectl create secret generic grafana-admin-credentials --from-literal=admin-user=XYZ --from-literal=admin-password=XYZ -n monitoring --dry-run=client -o yaml > grafana-admin.secret.yaml

# Second step is to use sops/age encryption to be able to store secret in git
# Use encryption funtion defined in .bashrc
encrypt grafana-admin.secret.yaml 

# Move encrypted secret to git
mv  grafana-admin.secret.sops.yaml ~/dev/homelab-k8s-gitops/infrastructure/production/monitoring/kube-prometheus-stack/
