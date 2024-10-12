variable "apex_domain_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "is_apex" {
  type = bool
}

variable "subdomain" {
  type    = string
  default = null
}
