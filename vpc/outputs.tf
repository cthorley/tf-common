output "availability_zones" {
  value = var.availability_zones
}


output "cidr_block" {
  value = aws_vpc.this.cidr_block
}


output "id" {
  value = aws_vpc.this.id
}


output "nat_gateways" {
  value = {for az in local.nat_gateway_availability_zones : az => aws_nat_gateway.this[az].id}
}


output "route_table_ids" {
  value = {
    private = {for az in local.nat_gateway_availability_zones : az => aws_route_table.private[az].id}
    public  = aws_route_table.public.id
  }
}


output "subnets" {
  value = {
    private = {for az in var.availability_zones : az => aws_subnet.private[az].id}
    public  = {for az in var.availability_zones : az => aws_subnet.public[az].id}
  }
}
