output "vm_count" {
  value = var.vm_count
}

output "node_names" {
  value = [for i in range(var.vm_count) : "${var.node_name}-${i + 1}"]
}

output "vm_ips" {
  value = [for i in range(var.vm_count) : var.vm_ips[i]]
}