resource "aws_eip" "nat_gateway" {
  for_each = toset(local.nat_gateway_availability_zones)

  tags = {
    Name = "${var.label}-nat-gateway-${each.key}"
  }
}


resource "aws_nat_gateway" "this" {
  depends_on = [aws_internet_gateway.this]

  for_each = toset(local.nat_gateway_availability_zones)

  subnet_id     = aws_subnet.public[each.key].id
  allocation_id = aws_eip.nat_gateway[each.key].id

  tags = {
    Name = (length(local.nat_gateway_availability_zones) > 1
      ? "${var.label}-${each.key}"
      : var.label
    )
  }
}
