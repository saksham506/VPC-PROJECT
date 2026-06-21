# creting private instance in private subnet
resource "aws_instance" "ins-2" {
  ami           = "ami-0388e3ada3d9812da"
  instance_type = "t3.micro"
  key_name      = "vpc-terraform"
    subnet_id     = aws_subnet.private.id
    vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  tags = {
    Name = "private-instance"
  }
}