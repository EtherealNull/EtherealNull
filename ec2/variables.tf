variable "instance_type" {
  description = "Type of instance to create"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair to use for EC2"
  type        = string
}
