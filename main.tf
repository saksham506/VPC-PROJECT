# creating vpc
resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }
}
# create public subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/22"
  map_public_ip_on_launch = true
  tags = {
    Name = "public subnet"
  }
}
# create private subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.4.0/22"

  tags = {
    Name = "private subnet"
  }
}
# create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet gateway"
  }
}
# create public route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

# it is attaching public rt to internet gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public route table"
  }
}
# creating private route table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id

  # it is attaching private rt to nat gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-1.id
  }
  tags = {
    Name = "private route table"
  }
}
# attaching public subnet to public route table
resource "aws_route_table_association" "public-subnet-association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}
# attaching private subnet to private route table
resource "aws_route_table_association" "private-subnet-association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}