terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  vmid                   = var.vms_id_start + count.index + 1
  count                  = var.vm_count
  name                   = "${var.node_name}-${count.index + 1}"
  agent                  = 1
  define_connection_info = true
  agent_timeout          = 120
  target_node            = var.target_node
  scsihw                 = "virtio-scsi-single"
  vm_state               = "running"
  automatic_reboot       = true
  onboot                 = true

  memory = var.memory

  # Most cloud-init images require a serial device for their display
  serial {
    id = 0
  }

  cpu {
    cores   = var.cores
    limit   = 0
    numa    = false
    sockets = 1
    type    = "host"
    units   = 0
    vcores  = 0
  }

  disks {
    scsi {
      scsi0 {
        cdrom {
          iso = "local:iso/talos-amd64.iso" # Path to the ISO in Proxmox
        }
      }
      scsi1 {
        disk {
          size    = "20G"
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    id      = 0
    bridge  = var.network_bridge
    model   = "virtio"
    macaddr = var.vm_macs[count.index]
  }

  nameserver = var.vm_nameservers
  # Optional: IP config for Proxmox metadata only (Talos ignores this)
  ipconfig0 = "ip=dhcp"
  skip_ipv6 = true

  timeouts {
    create = "10m"
  }
}
