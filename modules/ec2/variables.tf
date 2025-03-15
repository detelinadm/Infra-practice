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
  default     = "~/.ssh/key.pub"
}

variable "trusted_ips_for_ssh" {
  description = "Lista av IP-adresser som släpps in till SSH (glöm inte /32)"
  type        = list(string)
  default     = []  # Tom lista betyder att INGA IP-adresser har SSH access
}

variable "restrict_ips_for_http" {
  description = "Lista av IP-adresser som släpps in till HTTP (glöm inte /32)"
  type        = list(string)
  default     = []  # Tom lista betyder att ALLA IP-adresser har HTTP access
}