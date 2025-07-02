module "talos_machine_configuration_worker" {
  depends_on       = [module.talos_machine_configuration_controlplane]
  source           = "../../../modules/proxmox/talos/talos_machine_configuration"
  cluster_name     = var.cluster_name
  cluster_endpoint = "https://${var.controller_vm_ips[0]}:6443"
  machine_type     = "worker"
  machine_secrets  = talos_machine_secrets.machine_secrets.machine_secrets
}
