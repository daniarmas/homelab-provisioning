terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

# Provider variables for Proxmox API connection
variable "proxmox_api_url" {
  type        = string
  description = "Proxmox API URL, e.g. https://<proxmox-host>:8006/api2/json"
}
variable "proxmox_api_token_id" {
  type        = string
  sensitive   = true
  description = "Proxmox API token ID"
}
variable "proxmox_api_token_secret" {
  type        = string
  sensitive   = true
  description = "Proxmox API token secret"
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  # This is the key line that allows self-signed SSL
  pm_tls_insecure = true
}