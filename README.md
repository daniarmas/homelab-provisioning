# homelab-provisioning

Infrastructure-as-Code to provision VMs for my homelab using Terraform and Proxmox.

## Overview

This project automates the provisioning of VMs for a [k8s](https://kubernetes.io/) cluster on a Proxmox using [Terraform](https://www.terraform.io/) and the [Telmate Proxmox provider](https://registry.terraform.io/providers/Telmate/proxmox/latest). It uses a modular structure to separate environment configuration from reusable VM provisioning logic.

## Requirements

- Proxmox VE cluster with API access and a suitable VM template
- Terraform >= 1.0
- Proxmox API token with sufficient permissions

## Usage

1. **Clone the repository**

   ```sh
   git clone https://github.com/daniarmas/homelab-provisioning
   cd homelab-provisioning/environments/proxmox
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
- The [modules/proxmox/main.tf](modules/proxmox/main.tf) file defines the VM provisioning logic and can be extended as needed.

## License

MIT License. See [LICENSE](LICENSE) for details.