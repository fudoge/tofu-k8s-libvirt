locals {
  vms = {
    "cp-1" = {
      name        = "cp-1"
      vcpu        = 2
      memory      = 2048
      volume_size = 20 * 1024 * 1024 * 1024
      addresses   = ["192.168.100.100"]
    },
    "worker-1" = {
      name        = "worker-1"
      vcpu        = 2
      memory      = 2048
      volume_size = 20 * 1024 * 1024 * 1024
      addresses   = ["192.168.100.200"]
    }
    "worker-2" = {
      name        = "worker-2"
      vcpu        = 2
      memory      = 2048
      volume_size = 20 * 1024 * 1024 * 1024
      addresses   = ["192.168.100.201"]
    }
  }
}

module "network" {
  source = "./modules/network"

  network_name      = "k8snet"
  network_domain    = "k8s.local"
  network_addresses = ["192.168.100.0/24"]

}

module "base_volume" {
  source            = "./modules/volume"
  base_image_source = "https://cloud-images.ubuntu.com/noble/20251026/noble-server-cloudimg-amd64/img"
}

module "vm" {
  source   = "./modules/vm"
  for_each = local.vms

  running = var.running

  vm_name  = each.name
  hostname = each.name
  vcpu     = each.vcpu
  memory   = each.memory

  base_volume_id = output.base_volume.id
  volume_size    = each.volume_size

  network_id = output.network.id
  addresses  = each.addresses

  cloud_init_ssh_key_path = var.ssh_key_path
}
