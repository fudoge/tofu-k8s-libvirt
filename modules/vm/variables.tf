variable "vm_name" {
  type = string
}

variable "running" {
  type = bool
}

variable "vcpu" {
  type = number
}

variable "memory" {
  type = number
}

variable "base_volume_id" {
  type = string
}

variable "volume_size" {
  type = string
}

variable "network_id" {
  type = string
}

variable "hostname" {
  type = string
}

variable "addresses" {
  type = list(string)
}

variable "cloud_init_ssh_key_path" {
  type = string
}
