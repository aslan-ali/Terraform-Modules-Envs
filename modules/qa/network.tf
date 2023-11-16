resource "aws_route_table" "private_route_qa" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.aws_nat_gateway
  }
  tags = {
    Name = "Private Route Table QA to NAT"
  }
}
resource "aws_route_table_association" "rta_subnet_private_qa" {
  subnet_id      = aws_subnet.vpc_private_subnet_qa.id
  route_table_id = aws_route_table.private_route_qa.id
}

resource "aws_route_table_association" "rta_subnet_public_qa" {
  subnet_id      = aws_subnet.vpc_subnet_qa.id
  route_table_id = var.route_table
}

resource "aws_subnet" "vpc_subnet_qa" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnets_qa
  availability_zone       = var.availability_zone_qa
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_subnets_qa"
  }
}
