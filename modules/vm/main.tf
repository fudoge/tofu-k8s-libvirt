resource "libvirt_domain" "vm" {
  name = var.vm_name

  running = var.running

  vcpu   = var.vcpu
  memory = var.memory

  disk {
    volume_id = libvirt_volume.volume.id
  }

  network_interface {
    network_id = var.network_id
    hostname   = var.hostname
    addresses  = var.addresses
  }

  cloudinit = libvirt_cloudinit_disk.commoninit.id
}

resource "libvirt_volume" "volume" {
  name           = "${var.vm_name}.qcow2"
  size           = var.volume_size
  base_volume_id = var.base_volume_id
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "${var.vm_name}.iso"
  user_data = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
  vars = {
    ssh_key = file(pathexpand(var.cloud_init_ssh_key_path))
  }
}
