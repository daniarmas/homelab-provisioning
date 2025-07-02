module "machine_configuration_apply_controlplane" {
  source                      = "../../../modules/proxmox/talos/talos_machine_configuration_apply"
  depends_on                  = [module.talos_machine_configuration_controlplane, module.talos_machine_configuration_worker]
  client_configuration        = module.talos_client_configuration.client_configuration
  machine_configuration_input = module.talos_machine_configuration_controlplane.machine_configuration_input
  instances_count             = length(module.talos_controllers.node_names)
  node_names                  = var.controller_vm_ips
}

module "machine_configuration_apply_worker" {
  source                      = "../../../modules/proxmox/talos/talos_machine_configuration_apply"
  depends_on                  = [module.talos_machine_configuration_worker]
  client_configuration        = module.talos_client_configuration.client_configuration
  machine_configuration_input = module.talos_machine_configuration_worker.machine_configuration_input
  instances_count             = length(module.talos_workers.node_names)
  node_names                  = var.worker_vm_ips
}
