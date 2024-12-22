resource "aws_security_group" "ec2_security_group" {
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