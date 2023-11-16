variable "instance_type_dev" {
  description = "EC2 instance Type DEV"
  default     = "t3.micro"
}

variable "ec2_server" {
  default     = "ami-089c26792dcb1fbd4"
  description = "ec2_instance_ami"
}
variable "public_subnets_dev" {
  default     = "10.240.13.0/24"
  description = "Public_Subnet_For_Dev"
}
variable "private_subnets_dev" {
  description = "private_subnets for dev"
  default     = "10.240.10.0/24"
}
variable "availability_zone_dev" {
  description = "availability zone to create subnet"
  default     = "us-east-2a"
}
variable "volume_size_dev" {
  description = "Root Volume size"
  default     = 8
}
variable "vpc_id" {
  description = "VPC ID from global module"
}
variable "sg_id" {
  description = "Security group For Environments"
}
variable "key_name" {
  description = "SSH Key Name"
}
variable "aws_nat_gateway" {
  description = "Aws Nat Gateway"
}
variable "route_table" {
  description = "Route Table"
}
