module "dns" {
  source           = "../../modules/proxmox/dns"
  vms_id_start     = var.dns_vms_id
  vm_count         = var.dns_vm_count
  template         = var.template
  target_node      = var.target_node
  cores            = var.dns_cores
  memory           = var.dns_memory
  network_bridge   = var.network_bridge
  vm_user          = var.vm_user
  private_key_path = var.private_key_path
  public_key_path  = var.public_key_path
  vm_ips           = var.dns_vm_ips
  vm_nameservers   = var.dns_vm_nameservers
  gateway          = var.gateway
  hostname_prefix  = var.dns_hostname_prefix
  disk_size        = var.dns_disk_size
}
