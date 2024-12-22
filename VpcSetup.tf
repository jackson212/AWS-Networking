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

#Setting up and Public subnet 

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.public_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = merge(
    {
       Name = "PublicSubnet-${count.index + 1}"
    }
  
  )
}

#Setting up Private  subnet 


resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = merge(
    {
      Name = "PrivateSubnet-${count.index + 1}"
    },
  
  )
}



