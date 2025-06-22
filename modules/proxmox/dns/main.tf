terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc01"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  vmid                   = 300
  count                  = var.vm_count
  name                   = var.hostname_prefix
  agent                  = 1
  define_connection_info = true
  agent_timeout          = 120
  target_node            = var.target_node
  clone                  = var.template
  full_clone             = true
  scsihw                 = "virtio-scsi-single"
  vm_state               = "running"
  automatic_reboot       = true
  onboot                 = true

  os_type = "cloud-init"
  memory  = var.memory

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
        # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
        disk {
          storage = "local-lvm"
          # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
          size = var.disk_size
        }
      }
    }
    ide {
      # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    id     = 0
    bridge = var.network_bridge
    model  = "virtio"
  }

  # Cloud-Init configuration
  cicustom = "vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
  # ciupgrade  = true
  nameserver = var.vm_nameservers
  ipconfig0  = "ip=${var.vm_ips[count.index]}/24,gw=${var.gateway}"
  skip_ipv6  = true
  ciuser     = var.vm_user
  sshkeys    = file(var.public_key_path)

  provisioner "remote-exec" {
    inline = [
      "echo VM is up and accessible!"
    ]
    connection {
      type        = "ssh"
      user        = var.vm_user
      private_key = file(var.private_key_path)
      host        = self.default_ipv4_address
    }
  }

  timeouts {
    create = "10m"
  }
}