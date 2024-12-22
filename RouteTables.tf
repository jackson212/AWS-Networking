
#Public route tables and  Internet gateway is associate to it.
resource "aws_route_table" "public_route_table" {
  

  vpc_id = aws_vpc.VPC.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }

  tags = merge(
    {
      Name        = "PublicRouteTable",
      Project     = var.project,
      
    },

  )
}


#private route table  and enable route  with natGateways for internet access

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT-Gateway.id
  }

  tags = {
    Name = "Private Route Table"
  }
}


#private routetable associate with public subnets

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_blocks)

  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

#public routetable associate with private subnets

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_blocks)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}




