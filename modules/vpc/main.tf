#Create a VPC
resource "aws_vpc" "myvpc" {

  cidr_block =  "10.0.0.0/16"
   tags = {
    Name = "MyTofuVPC"
  }
}
data "aws_availability_zones" "available" {
  state = "available"
} 


resource "aws_subnet" "PublicSubnet"{
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a" 
  map_public_ip_on_launch = true # instances launched into the subnet should be assigned a public IP

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "PrivateSubnet"{
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
   availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id #VPC attached to gateway
}

# Create Route Table for the public subnet where network traffic is directed
resource "aws_route_table" "PublicRT"{
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0" # every IP adress should be connected to the gateway
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public Subnet Route Table"
  }
}

#Create a route table association to connect the route table to the public subnet
resource "aws_route_table_association" "PublicRTassociation" {
  subnet_id = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "Private Subnet Route Table"
  }
}

resource "aws_route_table_association" "PrivateRTassociation" {
  subnet_id = aws_subnet.PrivateSubnet.id
  route_table_id = aws_route_table.PrivateRT.id
}