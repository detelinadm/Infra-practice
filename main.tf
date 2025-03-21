module "vpc"{
    source = "./modules/vpc"
    
}

module "ec2" {
  source = "./modules/ec2"
  vpc_security_group_ids = module.vpc.vpc_security_group_ids
  private_subnet_id = module.vpc.private_subnet_id
  vpc_id    = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  }


module "alb" {
  source = "./modules/alb"
  vpc_id           = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}