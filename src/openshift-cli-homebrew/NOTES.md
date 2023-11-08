
## Connecting to OpenShift Local

[Red Hat OpenShift Local](https://developers.redhat.com/products/openshift-local/overview) is the quickest way to get started building OpenShift clusters. It is designed to run on a local computer to simplify setup and testing, and to emulate the cloud development environment locally with all of the tools needed to develop container-based applications. 

Prerequisites:
1. [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/)
2. [Red Hat OpenShift Local](https://developers.redhat.com/products/openshift-local/getting-started)

Steps:
1. Use `Kubernetes - Local Configuration` devcontainer profile to automatically copy localhost `~/.kube/config` to the devcontainer
2. Create `.devcontainer/compose.yaml`
```yaml
# .devcontainer/compose.yaml
---
services:
  devcontainer:
    image: mcr.microsoft.com/devcontainers/base:bullseye
    volumes:
      - ../..:/workspaces:cached
    command: sleep infinity
    extra_hosts:
      - "api.crc.testing:host-gateway"    # forwards api.crc.testing to docker host gateway
```
3. Update `.devcontainer/devcontainer.json`
```jsonc
// .devcontainer/devcontainer.json
{
	// Comment `image` field
	// "image": "mcr.microsoft.com/devcontainers/base:bullseye",

	// Add `dockerComposeFile`, `service`, `workspaceFolder` fields
	"dockerComposeFile": "compose.yaml",
	"service": "devcontainer",
	"workspaceFolder": "/workspaces/${localWorkspaceFolderBasename}"
}
```
