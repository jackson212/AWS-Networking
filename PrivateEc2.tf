


resource "aws_instance" "Private_ec2_instance" {
  ami                         = ami-0e2c8caa4b6378d8c  # here it showing ubuntu machine id
  instance_type               = "t2.micro"             # t2.micro machine
  
  subnet_id                   =  aws_subnet.private_subnet.id #choosing public_subnet for this instance
  key_name                    = aws_key_pair.key.Key_pair  # 
  associate_public_ip_address = false
  security_groups             = [aws_security_group.private_ec2_security_group.id]
  

}

resource "aws_security_group" "private_ec2_security_group" {
  vpc_id = aws_vpc.VPC.id
#all outbound traffic
  egress {
    
    
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  
  
  }
//ssh
  ingress {
    
    
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    cidr_blocks = [data.aws_vpc.VPC.cidr_block] 
  
  }

  ingress {
   
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_blocks = [data.aws_vpc.VPC.cidr_block] // 
  
  }




}

    # Allow inbound traffic on port 80 (HTTP)