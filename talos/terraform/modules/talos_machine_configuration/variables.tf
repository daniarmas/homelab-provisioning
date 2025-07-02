variable "cluster_name" {
  type        = string
  description = "Name of the Talos cluster"
}

variable "cluster_endpoint" {
  type        = string
  description = "Endpoint for the Talos cluster, e.g. 'https://<controller-ip>:6443'"
}

variable "machine_type" {
  type        = string
  description = "Type of the Talos machine, e.g. 'controlplane' or 'worker'"
}

variable "machine_secrets" {
  type        = any
  description = "Secrets for the Talos machine"
}
