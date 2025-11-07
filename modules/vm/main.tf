resource "libvirt_domain" "vm" {
  name = var.vm_name

  running = var.running

  vcpu   = var.vcpu
  memory = var.mem

  disk {
    volume_id = var.volume_id
  }

  network_interface {
    network_id = var.network_id
    hostname   = var.hostname
    addresses  = var.addresses
  }

}

resource "libvirt_volume" "volume" {
  name           = ".qcow2"
  size           = var.volume_size
  base_volume_id = var.base_volume_id
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "cloudinit.iso"
  user_data = data.template_file.user_data.rendered
}

data "template_file" "user_data" {
  template = file("${paht.module}/cloud_inif.cfg")
  vars = {
    ssh_key = file(var.cloud_init_ssh_key_path)
  }
}
