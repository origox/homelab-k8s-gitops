# FLUX CD

# Commands

```bash
# Create a source for an HTTPS public Helm repository
flux create source helm podinfo \
--url=https://stefanprodan.github.io/podinfo \
--interval=10m \
--export > podinfo-charts.yaml

# Create a HelmRelease with a chart from a HelmRepository source
flux create hr podinfo \
--interval=10m \
--source=HelmRepository/podinfo \
--chart=podinfo \
--chart-version=">4.0.0" \
--export > podinfo-release.yaml

# Check flux status
flux get all -A --status-selector ready=true
flux get all -A --status-selector ready=false
```