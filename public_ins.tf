# create one instance 
resource "aws_instance" "ins-1" {
  ami           = "ami-0388e3ada3d9812da"
  instance_type = "t3.micro"
  key_name      = "vpc-terraform"
    subnet_id     = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
    associate_public_ip_address = true
  tags = {
    Name = "public-instance"
  }
}
# attaching keypair to instance
resource "aws_key_pair" "keypair-1" {
  key_name   = "vpc-terraform"
  public_key = file("vpc.pub")
}
