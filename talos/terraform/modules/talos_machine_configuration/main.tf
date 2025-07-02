terraform {
  required_providers {
    talos = {
      source  = "siderolabs/talos"
      version = "0.9.0-alpha.0"
    }
  }
}

data "talos_machine_configuration" "machine_configuration" {
  cluster_name     = var.cluster_name
  cluster_endpoint = var.cluster_endpoint
  machine_type     = var.machine_type
  machine_secrets  = var.machine_secrets
}