output "vpc_id" {
  value = module.vpc.vpc_id
}


output "public_subnet1_id" {
  value = module.vpc.public_subnet1_id
}

output "public_subnet2_id" {
  value = module.vpc.public_subnet2_id
}
output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "vpc_security_group_ids" {
  value = module.vpc.vpc_security_group_ids
}

output "web1_ip" {
  value = module.ec2.Web-1-IP-adress
}

output "web2_ip" {
  value = module.ec2.Web-2-IP-adress
}

output "web3_private_ip" {
  value = module.ec2.Web-3-IP-adress
}

output "route_table_id" {
  value = module.vpc.private_route_table_id
}
