terraform {
  required_providers {
    talos = {
      source  = "siderolabs/talos"
      version = "0.9.0-alpha.0"
    }
  }
}

resource "talos_machine_configuration_apply" "cp_config_apply" {
  client_configuration        = var.client_configuration
  machine_configuration_input = var.machine_configuration_input
  count                       = var.instances_count
  node                        = var.node_names[count.index]
}
