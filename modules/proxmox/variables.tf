variable "vm_count" {
  type        = number
  description = "Number of VMs to create"
}

variable "template" {
  type        = string
  description = "VM template to clone"
}

variable "target_node" {
  type        = string
  description = "Proxmox node to deploy VMs on"
}

variable "cores" {
  type        = number
  description = "Number of vCPU cores"
}

variable "memory" {
  type        = number
  description = "RAM in MB"
}

variable "network_bridge" {
  type        = string
  description = "Proxmox bridge to attach VM NIC"
}

variable "disk_size" {
  type        = string
  description = "Disk size for VMs, e.g. '50G'"
}

variable "ssh_user" {
  type        = string
  description = "User for SSH and cloud-init"
}

variable "private_key_path" {
  type        = string
  description = "Path to private SSH key"
}

variable "public_key_path" {
  type        = string
  description = "Path to public SSH key for cloud-init"
}

variable "vm_ips" {
  type        = list(string)
  description = "List of static IPs to assign to each controller VM"
}

variable "gateway" {
  type        = string
  description = "Gateway IP for VM networking"
}

variable "hostname_prefix" {
  type        = string
  description = "Prefix used to name VMs"
}

variable "proxmox_api_url" {
  type        = string
  description = "Proxmox API URL, e.g. https://<proxmox-host>:8006/api2/json"
}
variable "proxmox_api_token_id" {
  type        = string
  sensitive   = true
  description = "Proxmox API token ID"
}
variable "proxmox_api_token_secret" {
  type        = string
  sensitive   = true
  description = "Proxmox API token secret"
}

