resource "aws_lb" "Load Balancer"{
   name = "aws_lb"
   load_balancer_type = "default"
   internal = false
   security_groups = [aws_security_group.lb_sg.id]
   subnets = aws_subnet.PublicSubnet.id

 }