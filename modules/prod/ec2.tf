resource "aws_subnet" "vpc_private_subnet_prod" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnets_prod
  map_public_ip_on_launch = "false"
  availability_zone       = var.availability_zone_prod
  tags = {
    "Environment" = "Prod"
    "Name"        = "Private Subnets-Prod"
  }
}

resource "aws_instance" "prod_linux" {
  ami                         = var.ec2_server
  instance_type               = var.instance_type_prod
  vpc_security_group_ids      = var.sg_id
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.vpc_private_subnet_prod.id
  associate_public_ip_address = false
  user_data                   = <<-EOF
  #!/bin/bash
  sudo yum update
  sudo yum install -y docker
  sudo yum install -y nginx
  sudo usermod -a -G docker ec2-user
  sudo service docker start
  sudo chkconfig docker on
  sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
  sudo chmod +x /usr/local/bin/docker-compose
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  EOF
  tags = {
    Name = "PROD_ENV_SERVER"
  }
  root_block_device {
    volume_size = var.volume_size_prod
  }
}
