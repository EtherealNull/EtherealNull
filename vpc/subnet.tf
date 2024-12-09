# Create Public Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main-Dev.id
  cidr_block        = var.public_subnet_cidr
  availability_zone       = "ap-southeast-1a" 
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet"
  }
  provider = aws.target_account
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.main-Dev.id
  cidr_block        = var.public_subnet_cidr2
  availability_zone       = "ap-southeast-1b" 
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet2"
  }
  provider = aws.target_account
}

# Create Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main-Dev.id
  cidr_block = var.private_subnet_cidr
  tags = {
    Name = "PrivateSubnet"
  }
  provider = aws.target_account
}
