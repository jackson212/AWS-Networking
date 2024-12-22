# data aws_vpc "VPC" {
#   default = true  
# }


resource "aws_instance" "Private_ec2_instance" {
  ami                         = "ami-0bee12a638c7a8942"  # here it showing ubuntu machine id
  instance_type               = "t2.micro"             # t2.micro machine
  
  subnet_id                   =  aws_subnet.private_subnet[0].id  #choosing public_subnet for this instance
  key_name                    = "Key_pair"  # 
  associate_public_ip_address = false
  vpc_security_group_ids            = [aws_security_group.ec2_security_group.id]
  

}

# resource "aws_security_group" "private_ec2_security_group" {
#   vpc_id = aws_vpc.VPC.id
# #all outbound traffic
#   egress {
    
    
#     from_port  = 0
#     to_port    = 0
#     protocol   = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
  
  
#   }
# //ssh
#   ingress {
    
    
#     from_port  = 22
#     to_port    = 22
#     protocol   = "tcp"
#     cidr_blocks = [data.aws_vpc.VPC.cidr_block] 
  
#   }

#   ingress {
   
#     from_port  = 80
#     to_port    = 80
#     protocol   = "tcp"
#     cidr_blocks = [data.aws_vpc.VPC.cidr_block] // 
  
#   }




# }

    # Allow inbound traffic on port 80 (HTTP)