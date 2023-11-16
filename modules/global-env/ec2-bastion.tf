resource "aws_instance" "Bastion_Host" {
  ami                         = var.ec2_server
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.Bastion_SG.id]
  key_name                    = "ssh-key"
  subnet_id                   = aws_subnet.vpc_subnet_bastion.id
  associate_public_ip_address = true
  tags = {
    Name        = "Bastion Host"
    description = "bastion host for ssh connection"
  }
}
