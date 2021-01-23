#===========================================================================================================================

resource "aws_security_group" "simple" {
  name   = "simple"
  vpc_id = aws_vpc.simple.id
  ingress {
    description = "icmp"
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh"
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "web"
    from_port   = "80"
    to_port     = "82"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "efs"
    from_port   = "2049"
    to_port     = "2049"
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.simple.cidr_block]
  }
  ingress {
    description = "syslog"
    from_port   = "514"
    to_port     = "514"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "syslog"
    from_port   = "514"
    to_port     = "514"
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "any"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#---------------------------------------------------------------------------------------------------------------------------

resource "aws_network_acl" "simple" {
  vpc_id     = aws_vpc.simple.id
  subnet_ids = [aws_subnet.simple.id]
  ingress {
    protocol   = "all"
    rule_no    = 9999
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = "all"
    rule_no    = 9999
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = local.project_name
  }
}

#===========================================================================================================================
