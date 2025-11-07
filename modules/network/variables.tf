variable "network_name" {
  type    = string
  default = "k8snet"
}

variable "network_domain" {
  type    = string
  default = "k8s.local"
}

variable "network_addresses" {
  type    = list(string)
  default = ["192.168.100.0/24"]
}
