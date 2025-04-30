resource "aws_vpc" "iac_lab_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "public_subnet" {
  count                   = var.number_of_public_subnets
  vpc_id                  = aws_vpc.iac_lab_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 3, count.index + 1)
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s-public-subnet-%s", var.prefix, count.index)
  }
}

resource "aws_subnet" "private_subnet" {
  count             = var.number_of_private_subnets
  vpc_id            = aws_vpc.iac_lab_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 3, count.index + 3)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s-private-subnet-%s", var.prefix, count.index)
  }
}

resource "aws_subnet" "secure_subnet" {
  count             = var.number_of_secure_subnets
  vpc_id            = aws_vpc.iac_lab_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 3, count.index + 5)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = format("%s-secure-subnet-%s", var.prefix, count.index)
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.iac_lab_vpc.id

  tags = {
    Name = format("%s-internet_gateway", var.prefix)
  }
}

resource "aws_eip" "elasticIp" {
  domain = "vpc"
  tags = {
    Name = format("%s-elasticIp", var.prefix)
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elasticIp.id
  subnet_id     = aws_subnet.public_subnet[1].id

  tags = {
    Name = format("%s-nat-gateway", var.prefix)
  }
  depends_on = [aws_internet_gateway.gw]
}

# Route table
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.iac_lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = format("%s-public-route-table", var.prefix)
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.iac_lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = format("%s-private-route-table", var.prefix)
  }
}

resource "aws_route_table_association" "associate_public_subnet" {
  count          = var.number_of_public_subnets
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.public-route-table.id

}

resource "aws_route_table_association" "associate_private_subnet" {
  count          = var.number_of_private_subnets
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}


resource "aws_route_table_association" "associate_secure_subnet" {
  count          = var.number_of_secure_subnets
  subnet_id      = aws_subnet.secure_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}