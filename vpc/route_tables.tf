resource "aws_route_table" "private" {
  for_each = toset(local.nat_gateway_availability_zones)

  vpc_id = aws_vpc.this.id

  tags = {
    Name = (length(local.nat_gateway_availability_zones) > 1
      ? "${var.label}-private-${each.key}"
      : "${var.label}-private"
    )
  }
}


resource "aws_route" "private" {
  for_each = toset(local.nat_gateway_availability_zones)

  route_table_id = (length(local.nat_gateway_availability_zones) > 1
    ? aws_route_table.private[each.key].id
    : aws_route_table.private[local.nat_gateway_availability_zones[0]].id
  )

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = (length(local.nat_gateway_availability_zones) > 1
    ? aws_nat_gateway.this[each.key].id
    : aws_nat_gateway.this[local.nat_gateway_availability_zones[0]].id
  )
}


resource "aws_route_table_association" "private" {
  for_each = toset(var.availability_zones)

  route_table_id = (length(local.nat_gateway_availability_zones) > 1
    ? aws_route_table.private[each.key].id
    : aws_route_table.private[local.nat_gateway_availability_zones[0]].id
  )

  subnet_id = aws_subnet.private[each.key].id
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.label}-public"
  }
}


resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}


resource "aws_route_table_association" "public" {
  for_each = toset(var.availability_zones)

  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public[each.key].id
}
