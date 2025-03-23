terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


# Key pair based on an existing key
resource "aws_key_pair" "deployer_key" {
 key_name   = var.key_name
  public_key = file(var.public_key_path)
}


# Make 1 public server
resource "aws_instance" "web1"{
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.public_subnet_id
    key_name        = aws_key_pair.deployer_key.key_name

  vpc_security_group_ids = [aws_security_group.web_sg.id]
    associate_public_ip_address = true
    tags = {
    Name = "WebServer-1"
  }
    }

#Make second public server
resource "aws_instance" "web2"{
  ami = var.ami_id
  instance_type = var.instance_type
    
    subnet_id = var.public_subnet_id
    key_name        = aws_key_pair.deployer_key.key_name

  vpc_security_group_ids = [aws_security_group.web_sg.id]
    associate_public_ip_address = true
     tags = {
    Name = "WebServer-2"
  }
    }

#Make 1 private server for database 
resource "aws_instance" "web3"{
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.private_subnet_id
     tags = {
    Name = "WebServer-3"
  }
    }

resource "aws_security_group" "web_sg" {
    name = "web_sg"
    description = "Security group for web server"
    vpc_id = var.vpc_id 
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = var.trusted_ips_for_ssh  # Allow SSH only from these IPs
  } 
  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]    
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
    
}

resource "aws_security_group" "db_sg" {
    name = "db_sg"
    description = "Security group for Database Server"
    vpc_id = var.vpc_id
    # Allow PostgreSQL (5432) traffic only from web servers
  ingress {
    from_port       = 5432  
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]  # Only allow web servers that are in that security group to have access
  }


  tags = {
    Name = "DatabaseSecurityGroup"
  }
    
}