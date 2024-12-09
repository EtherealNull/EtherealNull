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
    path = "../vpc/terraform.tfstate"
  }
}

resource "aws_db_instance" "main_RDS" {
  identifier        = "my-rds-instance"  # ชื่อของ RDS instance
  db_name           = "mydatabase"       # ชื่อฐานข้อมูลเริ่มต้น
  instance_class    = "db.t3.micro"      # ขนาด instance
  allocated_storage = 20                  # ขนาด storage (ใน GB)
  engine            = "MariaDB"            # ฐานข้อมูลที่ใช้ (เช่น MySQL)
  engine_version    = "11.4.3"           # เวอร์ชันของ MySQL
  username          = "admin"            # ชื่อผู้ใช้ DB
  password          = "password"         # รหัสผ่าน DB
  skip_final_snapshot = true             # ข้าม snapshot เมื่อลบ RDS instance

    vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id_rds]
    db_subnet_group_name   = aws_db_subnet_group.main.name

  tags = {
    Name = "MyRDSInstance"
  }
  provider = aws.target_account
}
resource "aws_db_subnet_group" "main" {
  name       = "my-db-subnet-group"
  subnet_ids = [
    data.terraform_remote_state.vpc.outputs.public_subnet_id,
    data.terraform_remote_state.vpc.outputs.public_subnet_id2
  ]

  tags = {
    Name = "MyDBSubnetGroup"
  }
  provider = aws.target_account
}



