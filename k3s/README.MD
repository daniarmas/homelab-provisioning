# K3s Provisioning

This folder contains the Terraform and Ansible configurations for provisioning a [K3s](https://k3s.io/) Kubernetes cluster and a DNS server on Proxmox.

## Overview

- Provisions control plane and worker VMs for K3s using reusable modules from the project’s `modules/` directory.
- Designed to be used after the DNS infrastructure is provisioned.
- Automates both infrastructure provisioning (Terraform) and configuration (Ansible).

## Requirements

- Proxmox VE cluster
- Proxmox API token with sufficient permissions
- [Terraform](https://www.terraform.io/) (version 1.0 or higher recommended)
- [Ansible](https://www.ansible.com/) (for post-provisioning configuration)
- Python 3 (for Ansible virtual environment)

## Usage

### 1. Provision DNS Infrastructure

1. **Navigate to the DNS Terraform folder:**
   ```sh
   cd terraform/dns
   ```

2. **Create and edit `terraform.tfvars` to match your environment:**
   ```sh
   cp tfvars-example terraform.tfvars
   ```

3. **Initialize and apply Terraform:**
   ```sh
   terraform init
   terraform apply
   ```

4. **Configure DNS with Ansible:**
   ```sh
   cd ../../ansible
   source .venv/bin/activate
   ansible-playbook -i inventory/inventory.yaml playbooks/03-install-dns.yaml
   ```
   > **Note:** If you see an error like `Could not get lock /var/lib/dpkg/lock-frontend`, running the playbook, it means the VM is still running `apt upgrade` in the background. Just wait a minute and re-run the playbook.

5. **Test the DNS server:**
   After the playbook completes, you can verify the DNS server is working by running the following command from your local machine or any VM that can reach the DNS server:

   ```sh
   dig @<dns-ip> google.com
   ```

   Replace `<dns-ip>` with the IP address of your DNS VM.  
   If you get a valid DNS response, your DNS server is working correctly!

### 2. Provision K3s Cluster

1. **Go to the k3s folder**
   ```sh
   cd ../terraform/k3s/
   ```

2. **Create and edit `terraform.tfvars` for K3s:**
   ```sh
   cp tfvars-example terraform.tfvars
   ```

3. **Initialize and apply Terraform:**
   ```sh
   terraform init
   terraform apply
   ```
4. **Configure K3s with Ansible:**
   ```sh
   cd ../../ansible
   source .venv/bin/activate
   ansible-playbook -i inventory/inventory.yaml playbooks/04-k3s-ha.yaml
   ```
5. **Retrieve the kubeconfig:**
   - SSH into `controller1` and copy `/etc/rancher/k3s/k3s.yaml` to your local machine.
   - Edit the server address in the kubeconfig to match your cluster's public endpoint.

## License

MIT License. See [LICENSE](../LICENSE) for details.