# terraform {
#   required_providers {
#     proxmox = {
#       source  = "Telmate/proxmox"
#       version = "3.0.2-rc01"
#     }
#   }
# }

# resource "proxmox_vm_qemu" "dns" {
#   count            = 1
#   name             = "dns"
#   agent            = 1
#   target_node      = var.target_node
#   clone            = var.template
#   full_clone       = true
#   scsihw           = "virtio-scsi-single"
#   vm_state         = "running"
#   automatic_reboot = true
#   onboot           = true

#   os_type = "cloud-init"
#   memory  = 4096

#   # Most cloud-init images require a serial device for their display
#   serial {
#     id = 0
#   }

#   cpu {
#     cores   = 2
#     limit   = 0
#     numa    = false
#     sockets = 1
#     type    = "host"
#     units   = 0
#     vcores  = 0
#   }

#   disks {
#     scsi {
#       scsi0 {
#         # We have to specify the disk from our template, else Terraform will think it's not supposed to be there
#         disk {
#           storage = "local-lvm"
#           # The size of the disk should be at least as big as the disk in the template. If it's smaller, the disk will be recreated
#           size = "20G"
#         }
#       }
#     }
#     ide {
#       # Some images require a cloud-init disk on the IDE controller, others on the SCSI or SATA controller
#       ide1 {
#         cloudinit {
#           storage = "local-lvm"
#         }
#       }
#     }
#   }


#   network {
#     id     = 0
#     bridge = var.network_bridge
#     model  = "virtio"
#   }


#   # Cloud-Init configuration
#   cicustom   = "vendor=local:snippets/qemu-guest-agent.yml" # /var/lib/vz/snippets/qemu-guest-agent.yml
#   ciupgrade  = true
#   nameserver = "8.8.8.8 1.1.1.1"
#   ipconfig0  = "ip=172.30.0.30/24,gw=172.30.0.1"
#   skip_ipv6  = true
#   ciuser     = "cloud"
#   sshkeys    = file(var.public_key_path)

#   # provisioner "remote-exec" {
#   #   inline = [
#   #     "while sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do sleep 1; done",
#   #     "sudo apt install -y qemu-guest-agent",
#   #     "sudo systemctl enable qemu-guest-agent",
#   #     "sudo systemctl start qemu-guest-agent",
#   #   ]

#   #   connection {
#   #     type        = "ssh"
#   #     user        = var.ssh_user
#   #     private_key = file(var.private_key_path)
#   #     host        = self.default_ipv4_address
#   #   }
#   # }

#   timeouts {
#     create = "10m"
#   }
# }
