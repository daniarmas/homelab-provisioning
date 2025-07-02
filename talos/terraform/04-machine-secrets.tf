resource "talos_machine_secrets" "machine_secrets" {
  depends_on = [module.talos_controllers, module.talos_workers]
}
