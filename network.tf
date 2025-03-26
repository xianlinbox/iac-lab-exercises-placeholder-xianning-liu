resource "aws_vpc" "iac_lab_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.iac_lab_vpc.id
  cidr_block = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = format("%s-public-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.iac_lab_vpc.id
  cidr_block = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = format("%s-public-subnet-2", var.prefix)
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.iac_lab_vpc.id
  cidr_block = var.subnet3_cidr
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = format("%s-private-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.iac_lab_vpc.id
  cidr_block = var.subnet4_cidr
availability_zone = "ap-southeast-2b"

  tags = {
    Name = format("%s-public-subnet-2", var.prefix)
  }
}


resource "aws_subnet" "secure_subnet_1" {
  vpc_id     = aws_vpc.iac_lab_vpc.id
  cidr_block = var.subnet5_cidr
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = format("%s-secure-subnet-1", var.prefix)
  }
}

resource "aws_subnet" "secure_subnet_2" {
  vpc_id     = aws_vpc.iac_lab_vpc.id
  cidr_block = var.subnet6_cidr

  tags = {
    Name = format("%s-secure-subnet-2", var.prefix)
  }
}
