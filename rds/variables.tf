variable "db_identifier" {
  description = "Identifier for the RDS instance"
  default     = "my-rds-instance"
}

variable "db_name" {
  description = "Database name"
  default     = "mydb"
}

variable "db_username" {
  description = "Database username"
  default     = "admin"
}

variable "db_password" {
  description = "Database password"
  default     = "mypassword123"
}
