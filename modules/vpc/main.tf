resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  enable_dns_support = true

  enable_dns_hostnames = true

  tags = {
    Name = "prod-vpc"
  }

}

resource "aws_subnet" "public_subnet_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_1_cidr

  availability_zone = var.public_subnet_1_az

  tags = {
    Name = "prod-public-subnet-1"
  }

}

resource "aws_subnet" "public_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = var.public_subnet_2_az

  tags = {
    Name = "prod-public-subnet-2"
  }

}

resource "aws_subnet" "private_subnet_1" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_1_cidr

  availability_zone = var.private_subnet_1_az

  tags = {
    Name = "prod-private-subnet-1"
  }

}

resource "aws_subnet" "private_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = var.private_subnet_2_az

  tags = {
    Name = "prod-private-subnet-2"
  }

}

resource "aws_internet_gateway" "main" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "prod-igw"
  }

}

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "prod-public-route-table"
  }

}

resource "aws_route_table_association" "public_subnet_1" {

  subnet_id = aws_subnet.public_subnet_1.id

  route_table_id = aws_route_table.public.id

}

resource "aws_route_table_association" "public_subnet_2" {

  subnet_id = aws_subnet.public_subnet_2.id

  route_table_id = aws_route_table.public.id

}

resource "aws_eip" "nat" {

  domain = "vpc"

  tags = {
    Name = "prod-nat-eip"
  }

}

resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_subnet_1.id

  tags = {
    Name = "prod-nat-gateway"
  }

  depends_on = [
    aws_internet_gateway.main
  ]

}

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "prod-private-route-table"
  }

}

resource "aws_route_table_association" "private_subnet_1" {

  subnet_id = aws_subnet.private_subnet_1.id

  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "private_subnet_2" {

  subnet_id = aws_subnet.private_subnet_2.id

  route_table_id = aws_route_table.private.id

}