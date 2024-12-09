provider "aws" {
  region = "ap-southeast-1"
  alias  = "target_account"

  assume_role {
    role_arn = "arn:aws:iam::779846819343:role/SwitchRoleToNewAccount"
  }
}

# Create VPC
resource "aws_vpc" "main-Dev" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Main-VPC-Dev"
  }
  provider = aws.target_account
}
