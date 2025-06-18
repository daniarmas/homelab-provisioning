module "proxmox_controller_nodes" {
  source           = "../../modules/proxmox"
  vm_count         = var.controllers_vm_count
  template         = var.template
  target_node      = var.target_node
  cores            = var.controllers_cores
  memory           = var.controllers_memory
  network_bridge   = var.network_bridge
  ssh_user         = var.ssh_user
  private_key_path = var.private_key_path
  public_key_path  = var.public_key_path
  vm_ips           = var.controller_vm_ips
  gateway          = var.gateway
  hostname_prefix  = var.controller_hostname_prefix
  disk_size        = var.controllers_disk_size
  # Proxmox API credentials
  proxmox_api_url          = var.proxmox_api_url
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
}
