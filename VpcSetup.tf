resource "aws_vpc" "VPC" {
  
cidr_block = var.cidr_block

enable_dns_support = true
enable_dns_hostnames = true
   tags = merge(
    {
      Name        = var.name,
      Project     = var.project,
      
    },
    
    
  )
}

#Setting a Private and Public subnet for AWS VPC 


resource "aws_subnet" "private" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = merge(
    {
      Name        = "PublicSubnet"
    },
  
  )
}


resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = merge(
    {
      Name        = "PrivateSubnet"
    },
  
  )
}
