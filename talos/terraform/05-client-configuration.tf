module "talos_client_configuration" {
  depends_on           = [talos_machine_secrets.machine_secrets]
  source               = "../../../modules/proxmox/talos/talos_client_configuration"
  cluster_name         = var.cluster_name
  client_configuration = talos_machine_secrets.machine_secrets.client_configuration
  endpoints            = var.controller_vm_ips
}
