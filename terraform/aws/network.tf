resource "aws_vpc" "vpc-obligatorio" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-obligatorio"
  }
}

resource "aws_subnet" "obligatorio-private-subnet1" {
  vpc_id = aws_vpc.vpc-obligatorio.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "obligatorio-private-subnet1"
  }
}


resource "aws_subnet" "obligatorio-private-subnet2" {
  vpc_id = aws_vpc.vpc-obligatorio.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "obligatorio-private-subnet2"
  }

}

resource "aws_internet_gateway" "obligatorio_ig" {
  vpc_id = aws_vpc.vpc-obligatorio.id
  tags = {
    Name = "obligatorio_ig"
  }
}

resource "aws_default_route_table" "obligatorio_public-rt" {
  default_route_table_id = aws_vpc.vpc-obligatorio.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.obligatorio_ig.id
  }
}