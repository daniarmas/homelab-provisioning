module "talos_controllers" {
  source         = "../../../modules/proxmox/talos/vm"
  vms_id_start   = var.controllers_vms_id_start + 1
  vm_count       = var.controllers_vm_count
  target_node    = var.target_node
  cores          = var.controllers_cores
  memory         = var.controllers_memory
  network_bridge = var.network_bridge
  vm_ips         = var.controller_vm_ips
  vm_nameservers = var.vm_nameservers
  gateway        = var.gateway
  node_name      = var.controller_hostname_prefix
  disk_size      = var.controllers_disk_size
  vm_macs        = var.controlplane_vm_macs
}

output "controllers_vm_count" {
  value = module.talos_controllers.vm_count
}

output "controllers_node_names" {
  value = module.talos_controllers.node_names
}
