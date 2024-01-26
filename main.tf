module "network" {
  source    = "./modules/network"
  vpc_cidr  = "10.0.0.0/16"
}

module "security" {
  source = "./modules/security"
}

module "app_instances" {
  source           = "./modules/app_instances"
  subnet_id        = module.network.subnet_ids[0]  # Adjust based on your subnet configuration
  security_group_id = module.security.security_group_id
  instance_count   = 2  # Specify the desired number of instances
}

