


resource "aws_instance" "Public instance" {
  ami                         = ami-0e2c8caa4b6378d8c  # here it showing ubuntu machine id
  instance_type               = "t2.micro"             # t2.micro machine
  subnet_id                   =  aws_subnet.public_subnet.id #choosing public_subnet for this instance
  key_name                    = aws_key_pair.key.Key_pair  # 
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_ssh_a.id]
  lifecycle {
    ignore_changes = [security_groups]
  }
}

#security group for public ec2 ,which contain inbound and outbound rules.

resource "aws_security_group" "public_ec2_security_group" {
  vpc_id = aws_vpc.vpc_a.id
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
    cidr_blocks = ["0.0.0.0/0"]
  
  }
    # Allow inbound traffic on port 80 (HTTP)
  ingress {

    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  
  }




}

