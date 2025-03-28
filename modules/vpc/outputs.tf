output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "private_subnet_id" {
  value = aws_subnet.PrivateSubnet.id
}

output "public_subnet1_id" {
  value = aws_subnet.PublicSubnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.PublicSubnet2.id
}
output "vpc_security_group_ids" {
  value = aws_vpc.myvpc.default_security_group_id # Haven't made a sg so using default
}

output "private_route_table_id" {
  value = aws_route_table.PrivateRT.id
}
