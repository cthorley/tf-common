locals {
  nat_gateway_availability_zones = (var.redundant_nat_gateways
    ? var.availability_zones
    : [ var.availability_zones[0] ]
  )
}
