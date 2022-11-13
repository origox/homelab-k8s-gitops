#!/bin/bash

# AGE Encryption Setup - https://fluxcd.io/flux/guides/mozilla-sops/

# Install AGE and gen pub/priv keys
 
# Install After cluster setup and before flux bootstrap

## define namespace
kubectl create ns flux-system

## instert priv key to my cluster so we can decrypt sops secrets
cat $AGE_KEY_FIlE |
kubectl create secret generic sops-age \
--namespace=flux-system \
--from-file=age.agekey=/dev/stdin

## verify it is in place
kubectl -n flux-system describe secrets sops-age

