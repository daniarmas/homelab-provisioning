# homelab-provisioning
Infrastructure-as-Code to provision and configure VMs for my homelab using Terraform, Ansible and Proxmox.

## Overview
This project automates the provisioning and deployment of a [Kubernetes](https://kubernetes.io/) cluster on Proxmox using [Terraform](https://www.terraform.io/) with the [Telmate Proxmox provider](https://registry.terraform.io/providers/Telmate/proxmox/latest) and [Ansible](https://docs.ansible.com/). 

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
   cd homelab-provisioning/ansible
   ```
2. **Creates a virtual environment for Ansible**
   ```sh
   python3 -m venv .venv
   ```
3. **Activate the virtual environment**
   ```sh
   source .venv/bin/activate
   ```
4. **Install the python requirements for ansible**
   ```sh
   pip install -r requirements.txt
   ```
5. **Copy and edit the inventory**
   ```sh
   cp inventory/example-inventory.yaml inventory/inventory.yaml
   ```
6. **Run the vm-template ansible playbook to create the VM template**
   ```sh
   ansible % ansible-playbook -i inventory/inventory.yaml playbooks/01-vm-template.yaml
   ```
7. **Copy and edit variables**
   Copy `tfvars-example` to `terraform.tfvars` and fill in your environment-specific values (API credentials, VM specs, etc).
   ```sh
   cp tfvars-example terraform.tfvars
   ```
8. **Initialize Terraform**
   ```sh
   terraform init
   ```
9.  **Review the plan**
   ```sh
   terraform plan
   ```
10. **Apply the configuration**
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