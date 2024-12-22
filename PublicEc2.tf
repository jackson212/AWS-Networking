


resource "aws_instance" "Public_ec2_instance" {
  ami                         = "ami-0bee12a638c7a8942"  # here it showing ubuntu machine id
  instance_type               = "t2.micro"             # t2.micro machine
  subnet_id                   =  aws_subnet.public_subnet[0].id  #choosing public_subnet for this instance
  key_name                    = "Key_pair"  # 
  associate_public_ip_address = true
  vpc_security_group_ids           = [aws_security_group.ec2_security_group.id]
  
   tags = {
    Name = "public-instance"
  }

}


#security group for public ec2 ,which contain inbound and outbound rules.

# resource "aws_security_group" "public_ec2_security_group" {
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
#     cidr_blocks = ["0.0.0.0/0"]
  
#   }
#     # Allow inbound traffic on port 80 (HTTP)
#   ingress {

#     from_port  = 80
#     to_port    = 80
#     protocol   = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]  
  
#   }




# }


