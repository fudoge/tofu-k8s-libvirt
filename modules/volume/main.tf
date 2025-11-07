resource "libvirt_volume" "base" {
  name   = "ubuntu-24.04-lts"
  pool   = "default"
  source = var.base_image_source
  format = "qcow2"
}
