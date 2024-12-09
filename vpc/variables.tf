variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "172.16.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "172.16.1.0/24"
}

variable "public_subnet_cidr2" {
  description = "CIDR block for the public subnet"
  default     = "172.16.2.0/24"
}
variable "private_subnet_cidr" {
  description = "CIDR block for the Private Subnet"
  default     = "172.16.10.0/24"
}