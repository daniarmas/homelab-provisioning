# K3s Provisioning

This folder contains the Terraform and Ansible configurations for provisioning a [K3s](https://k3s.io/) Kubernetes cluster on Proxmox.

## Overview

- Provisions controller and worker VMs for K3s using reusable modules from the project’s `modules/` directory.
- Designed to be used after the DNS infrastructure is provisioned.

## Requirements

- Proxmox VE cluster
- [Terraform](https://www.terraform.io/) (version 1.0 or higher recommended)
- Proxmox API token with sufficient permissions

## Usage

1. **Initialize Terraform:**
   ```sh
   cd terraform/dns 
   ```
2. **Create the `terraform.tfvars`** and edit the values to match your environment (VM specs, network, etc.).
   ```sh
   cp tfvars-example terraform.tfvars
   ``` 
3. **Init Terraform:**
   ```sh
   terraform init
   ```
4. **Run terraform apply**
   ```sh
   terraform apply
   ```
5. **Go the Ansible folder. When DNS Vm is Running**
   ```sh
   cd ../../ansible 
   ```
6. **Creates a virtual environment for Ansible**
   ```sh
   python3 -m venv .venv
   ```
7. **Activate the virtual environment**
   ```sh
   source .venv/bin/activate
   ```
8. **Install the python requirements for ansible**
   ```sh
   pip install -r requirements.txt
   ```
9. **Copy and edit the inventory to match your environment values**
   ```sh
   cp inventory/example-inventory.yaml inventory/inventory.yaml
   ```
10. **Run the vm-template ansible playbook to create the VM template**
   ```sh
   ansible-playbook -i inventory/inventory.yaml playbooks/01-vm-template.yaml
   ```
11. **Copy and edit variables**
   Copy `tfvars-example` to `terraform.tfvars` and fill in your environment-specific values (API credentials, VM specs, etc).
   ```sh
   cp tfvars-example terraform.tfvars
   ```
12. **Initialize Terraform**
   ```sh
   terraform init
   ```
13. **Review the plan**
   ```sh
   terraform plan
   ```
14. **Apply the configuration**
   ```sh
   terraform apply
   ```




## Customization

- Edit variables in `terraform.tfvars` to set the number of controllers, workers, VM specs, and network settings.
- The VM provisioning logic is defined in the shared module at `../modules/vm/`.

## License

MIT License. See