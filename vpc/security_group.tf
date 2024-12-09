# Create Security Group
resource "aws_security_group" "main-sg" {
  name        = "main-sg"
  description = "Allow inbound traffic for EC2 instances"
  vpc_id      = aws_vpc.main-Dev.id

 
  ingress {
    from_port   = 22   
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port   = 80   
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port   = 443  
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MainSG"
  }
  provider = aws.target_account
}


resource "aws_security_group" "main-sg-rds" {
  name        = "main-sg-rds"
  description = "Allow inbound traffic for EC2 instances"
  vpc_id      = aws_vpc.main-Dev.id

 
  ingress {
    from_port   = 3306   
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MainSG-rds"
  }
  provider = aws.target_account
}