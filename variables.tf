variable "ubuntu_22_04" {
  default = "fd8emvfmfoaordspe1jr"
}

variable "pub_key" {
  default = ""
}

variable "allow_ports" {
  description = "List of ports open on server"
  default = ["8080", "22", "80"]
}
