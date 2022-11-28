#!/bin/sh

# AGE Encryption Setup 

# Install AGE and gen pub/priv keys - https://fluxcd.io/flux/guides/mozilla-sops/
 
# Install After cluster setup and before flux bootstrap

## define namespace
kubectl create ns flux-system

## instert priv key to my cluster so we can decrypt sops secrets
cat $AGE_KEY_FILE |
kubectl create secret generic sops-age \
--namespace=flux-system \
--from-file=age.agekey=/dev/stdin

## verify it is in place
kubectl -n flux-system describe secrets sops-age

