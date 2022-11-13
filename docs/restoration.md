# Restoration

To restore my cluster

1. Setup a clean K3S cluster
    ```bash
    # Staging
    curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -

    # Production
    # - use ansible HA setup playbook
    ```
2. Add flux-system namespace and import private AGE key into cluster
    ```bash
    ./scripts/prereq-installation.sh
    ```
3. Bootstrap/Restore cluster config via Flux
    ```bash
    ./scripts/flux-bootstrap.sh
    ```