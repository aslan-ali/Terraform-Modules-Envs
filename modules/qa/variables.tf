variable "private_subnets_qa" {
  description = "private_subnets for qa"
  default     = "10.240.11.0/24"
}
variable "public_subnets_qa" {
  default     = "10.240.14.0/24"
  description = "Public_Subnet_For_QA"
}
variable "volume_size_qa" {
  description = "Root Volume size"
  default     = 8
}
variable "availability_zone_qa" {
  description = "availability zone to create subnet"
  default     = "us-east-2b"
}
variable "ec2_server" {
  default     = "ami-089c26792dcb1fbd4"
  description = "ec2_instance_ami"
}
variable "instance_type_qa" {
  description = "EC2 instance Type QA"
  default     = "t3.micro"
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
