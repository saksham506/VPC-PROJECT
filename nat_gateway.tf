# creating one nat gateway in public subnet
resource "aws_nat_gateway" "nat-1" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.igw]
}