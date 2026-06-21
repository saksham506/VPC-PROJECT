# create one elastic ip for nat gateway
resource "aws_eip" "eip-nat" {
  domain = "vpc"
}