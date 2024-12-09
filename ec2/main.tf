provider "aws" {
  region = "ap-southeast-1"
  alias  = "target_account"

  assume_role {
    role_arn = "arn:aws:iam::779846819343:role/SwitchRoleToNewAccount"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../vpc/terraform.tfstate" # ตรวจสอบว่า path นี้ชี้ไปที่ state file จริง
  }
}


resource "aws_instance" "example" {
  ami           = "ami-07c9c7aaab42cba5a" # Amazon Linux 2 AMI
  instance_type = var.instance_type
  subnet_id     = data.terraform_remote_state.vpc.outputs.public_subnet_id
  key_name      = var.key_name
   vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]
  tags = {
    Name = "EC2-Linux"
  }
  provider = aws.target_account
}
