resource "libvirt_network" "mynw" {
  name   = var.network_name
  mode   = "nat"
  domain = var.network_domain

  addresses = var.network_addresses
}
