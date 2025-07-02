## Overview
This project automates the provisioning and deployment of a [Kubernetes](https://kubernetes.io/) cluster on Proxmox using [Terraform](https://www.terraform.io/) with the [Telmate Proxmox provider](https://registry.terraform.io/providers/Telmate/proxmox/latest) and [Ansible](https://docs.ansible.com/). 

## Requirements
- Proxmox VE cluster with API access
- [Terraform](https://www.terraform.io/) (version 1.0 or higher recommended)
- Proxmox API token with sufficient permissions

## Usage
1. **Clone the repository**
   ```sh
   git clone https://github.com/daniarmas/homelab-provisioning
   ```

2. **Go the Ansible folder**
   ```sh
   cd k3s/ansible 
   ```
3. **Creates a virtual environment for Ansible**
   ```sh
   python3 -m venv .venv
   ```
4. **Activate the virtual environment**
   ```sh
   source .venv/bin/activate
   ```
5. **Install the python requirements for ansible**
   ```sh
   pip install -r requirements.txt
   ```
6. **Copy and edit the inventory to match your environment values**
   ```sh
   cp inventory/example-inventory.yaml inventory/inventory.yaml
   ```
7.  **Run the ansible playbook to create the VM template**
   ```sh
   ansible-playbook -i inventory/inventory.yaml playbooks/01-vm-template.yaml
   ```
7.  **Run the ansible playbook to create the cloud-init snippet**
   ```sh
   ansible-playbook -i inventory/inventory.yaml playbooks/02-create-cloud-init-snippets.yaml
   ```

## Provision
   - To provision k8s using k3s follow this [steps](./k3s/README.MD)
   - To provision k8s using Talos Linux follow this [steps](./talos/README.MD)
   
## Security
- **Never commit `terraform.tfvars` or any files containing secrets.**  
  The `.gitignore` is configured to prevent this.

## Customization
- Edit the variables in `terraform.tfvars` to match your network, VM specs, and Proxmox environment.
- The [terraform/modules/proxmox/main.tf](terraform/modules/proxmox/main.tf) file defines the VM provisioning logic and can be extended as needed.

## License
MIT License. See [LICENSE](LICENSE) for details.