variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  description = "Path to the private key used for ssh access"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
variable subnet_id {
description = "Subnets for modules"
}

variable "zone" {
  description = "Zone form modules"
}
variable env {
  description = "Enviroment"
}

variable "provision" {
  description = "Disable/Enable Provisioning"
}
