resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = "IGW: for public subnets"
  }
}