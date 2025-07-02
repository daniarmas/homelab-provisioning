variable "vms_id_start" {
  type        = number
  description = "Starting ID for VMs"
}

variable "vm_count" {
  type        = number
  description = "Number of VMs to create"
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

variable "vm_ips" {
  type        = list(string)
  description = "List of static IPs to assign to each controller VM"
}

variable "vm_nameservers" {
  type        = string
  description = "Space-separated list of DNS servers to configure in cloud-init"
}

variable "gateway" {
  type        = string
  description = "Gateway IP for VM networking"
}

variable "node_name" {
  type        = string
  description = "Name of the Proxmox node"
}

variable "vm_macs" {
  type = list(string)
}
