module "talos_workers" {
  depends_on     = [module.talos_controllers]
  source         = "../../../modules/proxmox/talos/vm"
  vms_id_start   = var.workers_vms_id_start + 1
  vm_count       = var.workers_vm_count
  target_node    = var.target_node
  cores          = var.workers_cores
  memory         = var.workers_memory
  network_bridge = var.network_bridge
  vm_ips         = var.worker_vm_ips
  vm_nameservers = var.vm_nameservers
  gateway        = var.gateway
  node_name      = var.worker_hostname_prefix
  disk_size      = var.workers_disk_size
  vm_macs        = var.workers_vm_macs
}

output "workers_vm_count" {
  value = module.talos_workers.vm_count
}

output "workers_node_names" {
  value = module.talos_workers.node_names
}
