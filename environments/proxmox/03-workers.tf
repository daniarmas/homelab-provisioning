module "proxmox_workers_nodes" {
  source           = "../../modules/proxmox/k8s"
  vms_id_start     = var.workers_vms_id_start
  vm_count         = var.workers_vm_count
  template         = var.template
  target_node      = var.target_node
  cores            = var.workers_cores
  memory           = var.workers_memory
  network_bridge   = var.network_bridge
  ssh_user         = var.ssh_user
  private_key_path = var.private_key_path
  public_key_path  = var.public_key_path
  vm_ips           = var.worker_vm_ips
  vm_nameservers   = var.vm_nameservers
  gateway          = var.gateway
  hostname_prefix  = var.worker_hostname_prefix
  disk_size        = var.workers_disk_size
  # Proxmox API credentials
  proxmox_api_url          = var.proxmox_api_url
  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
}
