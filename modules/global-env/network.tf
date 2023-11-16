resource "aws_eip" "nat_eip_envs" {
  domain     = "vpc"
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "NAT Gateway EIP envs"
  }
}

resource "aws_nat_gateway" "nat_envs" {
  allocation_id = aws_eip.nat_eip_envs.id
  subnet_id     = var.vpc_subnet_prod
}

resource "aws_eip" "Bastion_EIP" {
  instance = aws_instance.Bastion_Host.id
  domain   = "vpc"
  tags = {
    Name = "Bastion Host EIP"
  }
}

resource "aws_alb" "alb" {
  internal           = false
  name               = "Application-Loadbalancer"
  security_groups    = [aws_security_group.alb.id]
  subnets            = ["${var.vpc_subnet_dev}", "${var.vpc_subnet_qa}", "${var.vpc_subnet_prod}"]
  load_balancer_type = "application"
  tags = {
    Name = "Application Load Balancer"
  }
}
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc
  tags = {
    Name = "Global_Subnet"
  }
}

resource "aws_subnet" "vpc_subnet_bastion" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets_bastion
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone_dev
  tags = {
    Name = "Public Subnets_Bastion"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Route_Table_For_VPC"
  }
}
resource "aws_route_table_association" "rta_subnet_bastion_public" {
  subnet_id      = aws_subnet.vpc_subnet_bastion.id
  route_table_id = aws_route_table.route_table.id
}
