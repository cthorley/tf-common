variable "app" {
  type = string

  validation {
    condition     = length(regexall("^[a-z]+[0-9a-z]+$", var.app)) > 0
    error_message = "var.app must begin with a lowercase letter, and can only be composed of lowercase letters and digits"
  }
}


variable "env" {
  type = string

  validation {
    condition     = length(regexall("^[a-z]+[0-9a-z]+$", var.env)) > 0
    error_message = "var.env must begin with a lowercase letter, and can only be composed of lowercase letters and digits"
  }
}


variable "suffix" {
  type    = string
  default = null

  validation {
    condition     = (var.suffix == null) || (length(regexall("^[a-z]+[0-9a-z]+$", coalesce(var.suffix, "NULL"))) > 0)
    error_message = "var.suffix must begin with a lowercase letter, and can only be composed of lowercase letters and digits"
  }
}
