data "aws_availability_zones" "available" {}

resource "aws_vpc" "tf_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "tf_vpc"
  }
}

resource "aws_internet_gateway" "tf_internet_gateway" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "tf_igw"
  }
}

resource "aws_route_table" "tf_public_rt" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_internet_gateway.id
  }
  tags = {
    Name = "tf_public"
  }
}

resource "aws_default_route_table" "tf_private_rt" {
  default_route_table_id  = aws_vpc.tf_vpc.default_route_table_id

  tags = {
    Name = "tf_private"
  }
}

resource "aws_subnet" "tf_public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "tf_public_${count.index + 1}"
  }
}


