# Create Internet Gateway (IGW) for Public Subnet
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main-Dev.id
  tags = {
    Name = "MainIGW"
  }
  provider = aws.target_account
}