# Bitnami Sealed-Secrets

# Installation

# Encrypt secrets

From [Fluxcd guide - encrypt secrets](https://fluxcd.io/flux/guides/sealed-secrets/#encrypt-secrets)

```bash
#You can retrieve the public key with:
kubeseal --fetch-cert \
--controller-name=sealed-secrets-controller \
--controller-namespace=flux-system \
> pub-sealed-secrets.pem

# Generate a Kubernetes secret manifest with kubectl:
kubectl -n default create secret generic basic-auth \
--from-literal=user=admin \
--from-literal=password=change-me \
--dry-run=client \
-o yaml > basic-auth.yaml

# Encrypt the secret with kubeseal:
kubeseal --format=yaml --cert=pub-sealed-secrets.pem \
< basic-auth.yaml > basic-auth-sealed.yaml

#Delete the plain secret and apply the sealed one:
rm basic-auth.yaml
kubectl apply -f basic-auth-sealed.yaml

#Verify that the sealed-secrets controller has created the basic-auth Kubernetes Secret:
kubectl -n default get secrets basic-auth

```