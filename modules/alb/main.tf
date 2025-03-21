resource "aws_lb" "aws_lb"{
   name = "aws_lb"
   load_balancer_type = "application"
   internal = false
   security_groups = [aws_security_group.lb_sg.id]
   subnets = var.public_subnet_ids # create

  tags = {
    Name = "Application Load Balancer"
  }
 }

 #resource "aws_security_group" "lb_sg" {
#
 #  vpc_id = var.vpc_id # make ALB in the VPC
  # ingress {
   # from_port   = 80
    #to_port     = 80
    #protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
  #}

  #tags = {
   # Name = "ALB-SG"
  #}
#}
