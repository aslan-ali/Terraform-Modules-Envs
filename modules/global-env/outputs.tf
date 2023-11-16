output "vpc" {
  value = aws_vpc.vpc.id
}
output "sg_env_id" {
  value = aws_security_group.SG_ENVS.id
}
output "ssh_key_name" {
  value = aws_key_pair.tf-key-pair.key_name
}
output "aws_nat_gateway" {
  value = aws_nat_gateway.nat_envs.id
}
output "route_table" {
  value = aws_route_table.route_table.id
}
