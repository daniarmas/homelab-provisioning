module "k8s_controlplanes" {
  source           = "../modules/vm"
  vms_id_start     = var.controllers_vms_id_start + 1
  vm_count         = var.controllers_vm_count
  template         = var.template
  target_node      = var.target_node
  cores            = var.controllers_cores
  memory           = var.controllers_memory
  network_bridge   = var.network_bridge
  vm_user          = var.vm_user
  private_key_path = var.private_key_path
  public_key_path  = var.public_key_path
  vm_ips           = var.controller_vm_ips
  vm_nameservers   = var.vm_nameservers
  gateway          = var.gateway
  hostname_prefix  = var.controller_hostname_prefix
  disk_size        = var.controllers_disk_size
  ci_custom        = var.k8s_ci_custom
}
