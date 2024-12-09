output "vpc_id" {
  value = aws_vpc.main-Dev.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "public_subnet_id2" {
  value = aws_subnet.public2.id
}
output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}
output "security_group_id" {
  value = aws_security_group.main-sg.id
}

output "security_group_id_rds" {
  value = aws_security_group.main-sg-rds.id
}
