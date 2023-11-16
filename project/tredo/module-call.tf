module "dev" {
  source          = "../../modules/dev"
  vpc_id          = module.global.vpc
  sg_id           = module.global.sg_env_id
  key_name        = module.global.ssh_key_name
  aws_nat_gateway = module.global.aws_nat_gateway
  route_table     = module.global.route_table
}
module "qa" {
  source          = "../../modules/qa"
  vpc_id          = module.global.vpc
  sg_id           = module.global.sg_env_id
  key_name        = module.global.ssh_key_name
  aws_nat_gateway = module.global.aws_nat_gateway
  route_table     = module.global.route_table
}
module "prod" {
  source          = "../../modules/prod"
  vpc_id          = module.global.vpc
  sg_id           = module.global.sg_env_id
  key_name        = module.global.ssh_key_name
  aws_nat_gateway = module.global.aws_nat_gateway
  route_table     = module.global.route_table
}
module "global" {
  source          = "../../modules/global-env"
  vpc_subnet_prod = module.prod.vpc_subnet_prod
  vpc_subnet_dev  = module.dev.vpc_subnet_dev
  vpc_subnet_qa   = module.qa.vpc_subnet_qa
}
