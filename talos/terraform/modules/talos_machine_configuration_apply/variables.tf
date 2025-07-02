variable "instances_count" {
  type        = number
  description = "Number of Talos machine configurations to apply"
}

variable "node_names" {
  type        = list(string)
  description = "Names of the Proxmox nodes where the Talos machine configuration will be applied"
}

variable "machine_configuration_input" {
  type        = string
  description = "Input for the Talos machine configuration"
}

variable "client_configuration" {
  type        = any
  description = "Talos client configuration in YAML format"
}