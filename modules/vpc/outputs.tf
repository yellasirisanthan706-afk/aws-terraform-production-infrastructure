output "vpc_id" {

  value = aws_vpc.main.id

}

output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "nat_eip" {

  value = aws_eip.nat.public_ip

}

output "nat_gateway_id" {
  value = aws_nat_gateway.main.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}