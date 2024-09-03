resource "aws_subnet" "private" {
  for_each = zipmap(var.availability_zones, var.subnet_cidrs.private)

  availability_zone = each.key
  cidr_block        = each.value
  vpc_id            = aws_vpc.this.id

  tags = {
    Name = "${var.label}-private-${each.key}"
  }
}


resource "aws_subnet" "public" {
  for_each = zipmap(var.availability_zones, var.subnet_cidrs.public)

  availability_zone = each.key
  cidr_block        = each.value
  vpc_id            = aws_vpc.this.id

  tags = {
    Name = "${var.label}-public-${each.key}"
  }
}
