# Talos Provisioning

This folder contains the Terraform and Ansible configurations for provisioning a [Talos Linux](https://www.talos.dev/) Kubernetes cluster and a DNS server on Proxmox.

## Overview

- Provisions control plane and worker VMs for Talos using reusable modules from the project’s `modules/` directory.
- Designed to be used after the DNS infrastructure is provisioned.
- Automates both infrastructure provisioning (Terraform) and configuration (Ansible).

## Requirements

- Proxmox VE cluster
- Proxmox API token with sufficient permissions
- [Terraform](https://www.terraform.io/) (version 1.0 or higher recommended)
- [Ansible](https://www.ansible.com/) (for post-provisioning configuration)
- Python 3 (for Ansible virtual environment)
- [talosctl](https://www.talos.dev/v1.10/introduction/getting-started/) (Talos CLI tool)

## Usage

### 1. Proxmox & Ansible Setup

1. **Go to the Ansible folder:**
   ```sh
   cd ../k3s/ansible
   ```

2. **Create a Python virtual environment for Ansible:**
   ```sh
   python3 -m venv .venv
   ```

3. **Activate the virtual environment:**
   ```sh
   source .venv/bin/activate
   ```

4. **Install Ansible and Python requirements:**
   ```sh
   pip install -r requirements.txt
   ```

5. **Copy and edit the inventory to match your environment:**
   ```sh
   cp inventory/example-inventory.yaml inventory/inventory.yaml
   # Edit inventory/inventory.yaml as needed
   ```

6. **Run the Ansible playbook to create the VM template:**
   ```sh
   ansible-playbook -i inventory/inventory.yaml playbooks/01-vm-template.yaml
   ```

7. **Run the Ansible playbook to create the cloud-init snippet:**
   ```sh
   ansible-playbook -i inventory/inventory.yaml playbooks/02-create-cloud-init-snippets.yaml
   ```

### 2. Provision DNS Infrastructure

1. **Navigate to the DNS Terraform folder:**
   ```sh
   cd ../k3s/terraform/dns
   ```

2. **Create and edit `terraform.tfvars` to match your environment:**
   ```sh
   cp tfvars-example terraform.tfvars
   ```

3. **Initialize Terraform:**
   ```sh
   terraform init
   ```

4. **Apply the Terraform configuration:**
   ```sh
   terraform apply
   ```

5. **Return to the ansible folder:**
   ```sh
   cd ../../ansible
   ```

6. **Activate the Python virtual environment:**
   ```sh
   source .venv/bin/activate
   ```

7. **Run the Ansible playbook to configure DNS:**
   ```sh
   ansible-playbook -i inventory/inventory.yaml playbooks/03-install-dns.yaml
   ```
   > **Note:** If you see an error like `Could not get lock /var/lib/dpkg/lock-frontend` when running the playbook, it means the VM is still running `apt upgrade` in the background. Just wait a minute and re-run the playbook.

8. **Test the DNS server:**
   After the playbook completes, you can verify the DNS server is working by running the following command from your local machine or any VM that can reach the DNS server:

   ```sh
   dig @<dns-ip> google.com
   ```

   Replace `<dns-ip>` with the IP address of your DNS VM.  
   If you get a valid DNS response, your DNS server is working correctly!

### 3. Provision Talos Cluster

1. **Navigate to the Talos terraform folder:**
   ```sh
   cd ../../talos/terraform
   ```
   
2. **Create and edit `terraform.tfvars` to match your environment:**
   ```sh
   cp tfvars-example terraform.tfvars
   ```

3. **Initialize Terraform:**
   ```sh
   terraform init
   ```

4. **Apply the Terraform configuration:**
   ```sh
   terraform apply
   ```

## License

MIT License. See