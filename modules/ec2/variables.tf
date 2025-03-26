variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
  default     = "ami-05b10e08d247fb927" # Amazon Linux 2023
}

variable "instance_type" {
  description = "Typ av EC2-instans"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH Key Pair för EC2-instansen"
  type        = string
  default     = "tofu-key"
}

variable "public_key_path" {
  description = "Sökväg till den publika (<filnamn>.pub) SSH-nyckeln"
  type        = string
  default     = "/home/cloudshell-user/.ssh/key.pub"
}

variable "trusted_ips_for_ssh" {
  description = "Lista av IP-adresser som släpps in till SSH (glöm inte /32)"
  type        = list(string)
}

variable "restrict_ips_for_http" {
  description = "Lista av IP-adresser som släpps in till HTTP (glöm inte /32)"
  type        = list(string)
  default     = []  # Tom lista betyder att ALLA IP-adresser har HTTP access
}

variable "vpc_id" {
description = "ID of the VPC"
  type        = string
}

variable "public_subnet1_id"{
   description = "ID of the public subnet 1"
  type        = string
}

variable "public_subnet2_id"{
   description = "ID of the public subnet 2"
  type        = string
}
variable "private_subnet_id" {
  description = "The ID of the private subnet"
  type        = string
}
variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)

}
variable "ingress_rules" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}