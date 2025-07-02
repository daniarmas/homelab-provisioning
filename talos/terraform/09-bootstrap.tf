resource "talos_machine_bootstrap" "bootstrap" {
  depends_on           = [module.machine_configuration_apply_controlplane, module.machine_configuration_apply_worker]
  client_configuration = talos_machine_secrets.machine_secrets.client_configuration
  node                 = var.controller_vm_ips[0]
}

data "talos_cluster_health" "health" {
  depends_on           = [talos_machine_bootstrap.bootstrap]
  client_configuration = module.talos_client_configuration.client_configuration
  control_plane_nodes  = var.controller_vm_ips
  worker_nodes         = var.worker_vm_ips
  endpoints            = [for ip in var.controller_vm_ips : "${ip}:6443"]
}

resource "talos_cluster_kubeconfig" "kubeconfig" {
  depends_on           = [talos_machine_bootstrap.bootstrap, data.talos_cluster_health.health]
  client_configuration = talos_machine_secrets.machine_secrets.client_configuration
  node                 = var.controller_vm_ips[0]
}

output "talosconfig" {
  value     = module.talos_client_configuration.client_configuration
  sensitive = true
}

output "kubeconfig" {
  value     = talos_cluster_kubeconfig.kubeconfig.kubeconfig_raw
  sensitive = true
}
