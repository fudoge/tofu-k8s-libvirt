output "network_id" {
  description = "Network ID"
  value       = libvirt_network.mynw.id
}
output "name" {
  description = "Network Name"
  value       = var.network_name
}

output "internal_domain" {
  description = "Internal domain of this Network"
  value       = var.network_domain
}

output "network_address" {
  description = "Network IP CIDR"
  value       = var.network_addresses
}
