# homelab-provisioning
Infrastructure-as-Code to provision and configure VMs for my homelab using Terraform, Ansible and Proxmox.

## Overview
This project automates the provisioning of virtual machines for a [Kubernetes](https://kubernetes.io/) cluster on Proxmox using [Terraform](https://www.terraform.io/) and the [Telmate Proxmox provider](https://registry.terraform.io/providers/Telmate/proxmox/latest) Proxmox provider. The codebase follows a modular structure, separating environment-specific configuration from reusable VM provisioning logic for better maintainability and scalability.

## Requirements
- Proxmox VE cluster with API access
- A prepared VM template for cloning
- [Terraform](https://www.terraform.io/) (version 1.0 or higher recommended)
- Proxmox API token with sufficient permissions
- A [cloud-init](https://cloud-init.io/) snippet placed in `/var/lib/vz/snippets/` on your Proxmox node for VM

## Usage
1. **Clone the repository**
   ```sh
   git clone https://github.com/daniarmas/homelab-provisioning
   cd homelab-provisioning/terraform/environments/proxmox
   ```
2. **Copy and edit variables**
   Copy `tfvars-example` to `terraform.tfvars` and fill in your environment-specific values (API credentials, VM specs, etc).
   ```sh
   cp tfvars-example terraform.tfvars
   ```
3. **Initialize Terraform**
   ```sh
   terraform init
   ```
4. **Review the plan**
   ```sh
   terraform plan
   ```
5. **Apply the configuration**
   ```sh
   terraform apply
   ```

## Security
- **Never commit `terraform.tfvars` or any files containing secrets.**  
  The `.gitignore` is configured to prevent this.

## Customization
- Edit the variables in `terraform.tfvars` to match your network, VM specs, and Proxmox environment.
- The [terraform/modules/proxmox/main.tf](terraform/modules/proxmox/main.tf) file defines the VM provisioning logic and can be extended as needed.

## License
MIT License. See [LICENSE](LICENSE) for details.