variable "cluster_name" {
  type        = string
  description = "Name of the Talos cluster"
}

variable "endpoints" {
  type        = list(string)
  description = "List of Talos controller IPs or hostnames"
}

variable "client_configuration" {
  description = "Talos client configuration"
  type        = any
}
