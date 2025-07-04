# homelab-provisioning

Infrastructure-as-Code to provision and configure k8s for my homelab using Terraform, Ansible, and Proxmox.

## Overview

This project automates the provisioning and deployment of a [Kubernetes](https://kubernetes.io/) cluster on Proxmox using [Terraform](https://www.terraform.io/) with the [Telmate Proxmox provider](https://registry.terraform.io/providers/Telmate/proxmox/latest) and [Ansible](https://docs.ansible.com/).

The repository is organized in a modular way:
- Each environment or stack (e.g., `dns/`, `k3s/`, `talos/`) is defined in its own folder with separate Terraform configuration and state. This allows you to provision infrastructure components independently and in the required order (for example, DNS before K3s).

## Requirements
- Proxmox VE cluster with API access
- [Terraform](https://www.terraform.io/) (version 1.0 or higher recommended)
- Proxmox API token with sufficient permissions

## Usage

1. **Clone the repository:**
   ```sh
   git clone https://github.com/daniarmas/homelab-provisioning
   ```

2. **Follow the documentation for each stack:**
   - To provision Kubernetes using K3s, see the [K3s documentation](./k3s/README.md).
   - To provision Kubernetes using Talos Linux, see the [Talos documentation](./talos/README.md).

## Security

- **Never commit `terraform.tfvars` or any files containing secrets.**  
  The `.gitignore` is configured to prevent this.

## Customization

- Edit the variables in each stack’s `terraform.tfvars` to match your network, VM specs, and Proxmox environment.
- The [modules/proxmox/main.tf](modules/proxmox/main.tf) file defines the VM provisioning logic and can be extended as needed.

## License

MIT License. See [LICENSE](LICENSE) for details.