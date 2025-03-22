#Create a VPC
resource "aws_vpc" "myvpc" {
  # How many IPs will have access 
  cidr_block =  "10.0.0.0/16"
  # Tag is what is seen on the conosole
  tags = {
    Name = "MyTofuVPC"
  }
}

# Create a public subnet
resource "aws_subnet" "PublicSubnet"{
  # Make subnet inside a VPC
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true # instances launched into the subnet should be assigned a public IP
}

# Create a private subnet
resource "aws_subnet" "PrivateSubnet"{
  # Make subnet inside a VPC
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
}

# Internet Gateway to be attatched to the public subnet
resource "aws_internet_gateway" "igw" {
  # put it inside the vpc
  vpc_id = aws_vpc.myvpc.id 
}

# Create Route Table for the public subnet where network traffic is directed
resource "aws_route_table" "PublicRT"{
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0" # every IP adress should be connected to the gateway
    gateway_id = aws_internet_gateway.igw.id
  }
}

#Create a route table association to connect the route table to the public subnet
resource "aws_route_table_association" "PublicRTassociation" {
  subnet_id = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.PublicRT.id
}