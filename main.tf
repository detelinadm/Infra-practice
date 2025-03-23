provider "aws" {
  region = var.aws_region
}
module "vpc"{
    source = "./modules/vpc"
    
}

module "ec2" {
  source = "./modules/ec2"

  aws_region            = var.aws_region
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_name              = var.key_name
  public_key_path       = var.public_key_path

#Using the output from vpc module to input in ec2 variables module
  vpc_id                = module.vpc.vpc_id
  public_subnet_id      = module.vpc.public_subnet_id
  private_subnet_id     = module.vpc.private_subnet_id
  vpc_security_group_ids = [module.vpc.vpc_security_group_ids]

  trusted_ips_for_ssh   = var.trusted_ips_for_ssh
  restrict_ips_for_http = var.restrict_ips_for_http
}


module "alb" {
  
  source = "./modules/alb"
  vpc_id             = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id # or public_subnet_ids if you switch to a list output
  target_instance_ids = { # this is a map instead of a list
    web1 = module.ec2.web1_instance_id
    web2 = module.ec2.web2_instance_id}
}