# K3s Provisioning

This folder contains the Terraform and Ansible configurations for provisioning a [K3s](https://k3s.io/) Kubernetes cluster on Proxmox and a DNS server.

## Overview

- Provisions controlplanes and workers VMs for K3s using reusable modules from the project’s `modules/` directory.
- Designed to be used after the DNS infrastructure is provisioned.

## Requirements
- Proxmox VE cluster with API access
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
5. **Go the Ansible folder**
   ```sh
   cd ../../ansible 
   ```
6. **Activate the virtual environment**
   ```sh
   source .venv/bin/activate
   ```
7.  **Run the ansible playbook to setup the DNS**
   ```sh
   ansible-playbook -i inventory/inventory.yaml playbooks/03-install-dns.yaml
   ```

## Customization

- Edit variables in `terraform.tfvars` to set the dns vm specs.
- The VM provisioning logic is defined in the shared module.

## License

MIT License. See