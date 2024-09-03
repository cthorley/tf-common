variable "availability_zones" {
  type = list(string)
}


variable "cidr_block" {
  type = string
}



variable "label" {
  type = string
}


variable "redundant_nat_gateways" {
  type    = bool
  default = false
}


variable "subnet_cidrs" {
  type = object({
    private = list(string)
    public  = list(string)
  })
}
