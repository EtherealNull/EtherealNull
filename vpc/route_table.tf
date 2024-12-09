# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main-Dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "PublicRouteTable"
  }
  provider = aws.target_account
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
  provider       = aws.target_account
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main-Dev.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = {
    Name = "PrivateRouteTable"
  }
  provider = aws.target_account
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
  provider       = aws.target_account
}
