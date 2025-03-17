resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.1.0/25"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "iac-lab-placeholder:xianning-liu"
  }
}
