#===========================================================================================================================

resource "aws_vpc" "simple" {
  cidr_block           = "10.96.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = local.project_name
  }
}

resource "aws_subnet" "simple" {
  vpc_id                  = aws_vpc.simple.id
  cidr_block              = cidrsubnet(aws_vpc.simple.cidr_block, 8, 10)
  map_public_ip_on_launch = true
  tags = {
    Name = local.project_name
  }
}

#---------------------------------------------------------------------------------------------------------------------------

resource "aws_internet_gateway" "simple" {
  vpc_id = aws_vpc.simple.id
  tags = {
    Name = local.project_name
  }
}

#---------------------------------------------------------------------------------------------------------------------------

resource "aws_route_table" "simple" {
  vpc_id = aws_vpc.simple.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.simple.id
  }
  tags = {
    Name = local.project_name
  }
}

resource "aws_route_table_association" "simple" {
  subnet_id      = aws_subnet.simple.id
  route_table_id = aws_route_table.simple.id
}

#===========================================================================================================================
