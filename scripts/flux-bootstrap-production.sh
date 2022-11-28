#!/bin/bash

# export GITHUB_TOKEN and GITHUB_USER

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=homelab-k8s-gitops \
  --branch=main \
  --path=./clusters/production \
  --personal