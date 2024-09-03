resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.label
  }
}


resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.label
  }
}
