resource "aws_lb" "aws_lb"{
   name = "aws-lb"
   load_balancer_type = "application"
   internal = false
   security_groups = [aws_security_group.lb_sg.id]
   subnets = var.public_subnet_ids

  tags = {
    Name = "Application_Load_Balancer"
  }
 }

 resource "aws_security_group" "lb_sg" {
  vpc_id = var.vpc_id # make ALB in the VPC
   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALB-SG"
  }
}

#Target group
resource "aws_lb_target_group" "aws_lb_tg" {
  name     = "target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  }

#Listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.aws_lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.aws_lb_tg.arn
  }
}

#Attach instances to the target group
resource "aws_lb_target_group_attachment" "instances" {
  for_each = toset(var.target_instance_ids)

  target_group_arn = aws_lb_target_group.aws_lb_tg.arn
  target_id = each.key
  port = 80
}