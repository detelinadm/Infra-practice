resource "aws_lb" "Load Balancer"{
    name = "aws_lb"
    load_balancer_type = "application"
    security_groups = aws

}