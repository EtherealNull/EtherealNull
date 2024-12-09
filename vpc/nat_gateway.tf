# Create NAT Gateway for Private Subnet
resource "aws_eip" "nat" {
  tags = {
    Name = "NatEIP"
  }
  provider = aws.target_account
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "MainNATGateway"
  }
  provider = aws.target_account
}
