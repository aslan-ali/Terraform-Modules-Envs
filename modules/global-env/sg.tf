resource "aws_security_group" "SG_ENVS" {
  name   = "SG-Global"
  vpc_id = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.dynamic_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.Bastion_Host.private_ip}/32"]
  }
  tags = {
    Name = "Security Group for Environments"
  }

}

resource "aws_security_group" "Bastion_SG" {
  name   = "SG-Bastion"
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Bastion Host Security Group"
  }
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb" {
  name        = "terraform_alb_security_group"
  description = "Terraform load balancer security group"
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.dynamic_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Security Group ALB"
  }
}

