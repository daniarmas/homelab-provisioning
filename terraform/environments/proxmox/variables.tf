variable "vm_user" {
  type        = string
  description = "User for SSH and cloud-init"
}

variable "workers_vms_id_start" {
  type        = number
  description = "Starting ID for VMs"
}

variable "controllers_vms_id_start" {
  type        = number
  description = "Starting ID for controller VMs"
}

variable "controllers_vm_count" {
  type        = number
  description = "Number of VMs to create"
}

variable "workers_vm_count" {
  type        = number
  description = "Number of worker VMs to create"
}

variable "controllers_disk_size" {
  type        = string
  description = "Disk size for controller VMs, e.g. '50G'"

}

variable "vm_nameservers" {
  type        = string
  description = "Space-separated list of DNS servers to configure in cloud-init"

}

variable "workers_disk_size" {
  type        = string
  description = "Disk size for worker VMs, e.g. '175G'"
}

variable "template" {
  type        = string
  description = "VM template to clone"
}

variable "target_node" {
  type        = string
  description = "Proxmox node to deploy VMs on"
}

variable "controllers_cores" {
  type        = number
  description = "Number of vCPU cores for controller VMs"
}

variable "workers_cores" {
  type        = number
  description = "Number of vCPU cores for worker VMs"
}

variable "controllers_memory" {
  type        = number
  description = "RAM in MB for controller VMs"
}

variable "workers_memory" {
  type        = number
  description = "RAM in MB for worker VMs"
}

variable "network_bridge" {
  type        = string
  description = "Proxmox bridge to attach VM NIC"
}

variable "private_key_path" {
  type        = string
  description = "Path to private SSH key"
}

variable "public_key_path" {
  type        = string
  description = "Path to public SSH key for cloud-init"
}

variable "controller_vm_ips" {
  type        = list(string)
  description = "List of static IPs to assign to each controller VM"
}

variable "worker_vm_ips" {
  type        = list(string)
  description = "List of static IPs to assign to each worker VM"
}

variable "gateway" {
  type        = string
  description = "Gateway IP for VM networking"
}

variable "controller_hostname_prefix" {
  type        = string
  description = "Prefix used to name VMs"
}

variable "worker_hostname_prefix" {
  type        = string
  description = "Prefix used to name worker VMs"
}

# DNS variables
variable "dns_vms_id" {
  type        = number
  description = "Starting ID for DNS VMs"
}

variable "dns_vm_count" {
  type        = number
  description = "Number of DNS VMs to create"
}

variable "dns_cores" {
  type        = number
  description = "Number of vCPU cores for DNS VMs"
}

variable "dns_memory" {
  type        = number
  description = "RAM in MB for DNS VMs"
}

variable "dns_disk_size" {
  type        = string
  description = "Disk size for DNS VMs, e.g. '50G'"
}

variable "dns_hostname_prefix" {
  type        = string
  description = "Prefix used to name DNS VMs"
}

variable "dns_vm_ips" {
  type        = list(string)
  description = "List of static IPs to assign to each DNS VM"
}

variable "dns_vm_nameservers" {
  type        = string
  description = "Space-separated list of DNS servers to configure in cloud-init"

}