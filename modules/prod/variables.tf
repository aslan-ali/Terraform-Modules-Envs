variable "instance_type_prod" {
  description = "EC2 instance Type PROD"
  default     = "t3.micro"
}
variable "volume_size_prod" {
  description = "Root Volume size"
  default     = 8
}
variable "availability_zone_prod" {
  description = "availability zone to create subnet"
  default     = "us-east-2c"
}
variable "private_subnets_prod" {
  description = "private_subnets for prod"
  default     = "10.240.16.0/24"
}
variable "public_subnets_prod" {
  default     = "10.240.15.0/24"
  description = "Public_Subnet_For_PROD"
}
variable "ec2_server" {
  default     = "ami-089c26792dcb1fbd4"
  description = "ec2_instance_ami"
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
