variable "ec2_server" {
  default     = "ami-089c26792dcb1fbd4"
  description = "ec2_instance_ami"
}

variable "cidr_vpc" {
  description = "CIDR block for the subnet"
  default     = "10.240.0.0/16"
}

variable "public_subnets_bastion" {
  default     = "10.240.12.0/28"
  description = "Public_Subnet_For_Remote_Connection_BastionHost"
}
variable "availability_zone_dev" {
  description = "availability zone to create subnet"
  default     = "us-east-2a"
}
variable "dynamic_ports" {
  type    = list(any)
  default = [443, 80]
}
variable "vpc_subnet_prod" {
  description = "VPC subnet prod from prod module"
}
variable "ssh_port" {
  default = 22
}

variable "vpc_subnet_dev" {
  description = "VPC subnet dev from dev module"
}
variable "vpc_subnet_qa" {
  description = "VPC subnet qa from qa module"
}
