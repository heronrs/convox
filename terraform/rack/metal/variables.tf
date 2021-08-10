variable "docker_hub_username" {
  default = ""
}

variable "docker_hub_password" {
  default = ""
}

variable "domain" {
  default = ""
}

variable "image" {
  type = string
}

variable "name" {
  type = string
}

variable "registry_disk" {
  default = "50Gi"
}

variable "release" {
  type = string
}

variable "syslog" {
  default = ""
}

variable "whitelist" {
  default = ["0.0.0.0/0"]
}
