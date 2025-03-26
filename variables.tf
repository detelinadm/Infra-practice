variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
variable "ami_id" {
  default = "ami-05b10e08d247fb927"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "tofu-key"
}

variable "public_key_path" {
  default = "/home/cloudshell-user/.ssh/tofu-key.pub"
}

variable "trusted_ips_for_ssh" {
  type    = list(string)
  default = []
}

variable "restrict_ips_for_http" {
  type    = list(string)
  default = []
}
variable "ingress_rules" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC."
  type        = string
  default = "10.0.0.0/16"
}

