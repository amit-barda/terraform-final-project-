output "vpc_arn" {
  value       = aws_vpc.my_vpc.arn
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "vpc_cidr_block" {
  value       = aws_vpc.my_vpc.cidr_block
}

output "public_subnet_arn" {
  value       = aws_subnet.public-subnet.arn 
}  

output "public_subnet_id" {
  value = aws_subnet.public-subnet.id
}

output "public_subnet_cidr_blocks" {
  value       = aws_subnet.public-subnet.cidr_block
}  

output "private_subnet_arn" {
  value       = aws_subnet.private-subnet.arn 
}

output "private_subnet_id" {
  value = aws_subnet.private-subnet.id
}

output "private_subnet_cidr_blocks" {
  value       = aws_subnet.private-subnet.cidr_block
}  
  
