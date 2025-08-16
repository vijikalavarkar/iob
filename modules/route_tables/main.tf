resource "aws_route_table" "iob_public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.iob_public_rt_cidr
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = var.iob_public_rt_tag
  }
}