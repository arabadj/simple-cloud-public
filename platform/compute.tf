#===========================================================================================================================


data "template_file" "bootstrap" {
  template = file("${path.cwd}/bootstrap/bootstrap.yml")
  vars = {
    user_name = local.user_name
    key_value = local.key_value
  }
}

#---------------------------------------------------------------------------------------------------------------------------

locals {
  ami_name = "amzn-devel"
}

data "aws_ami" "simp_cloud" {
  owners = ["self"]
  filter {
    name   = "name"
    values = [local.ami_name]
  }
}

#---------------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "simp_cloud" {
  tags = {
    Name = "simp_cloud"
    DNS  = "True"
  }
  # ami                    = "ami-076431be05aaf8080" # Default
  ami                    = data.aws_ami.simp_cloud.image_id # Packer
  instance_type          = "t2.micro"
  key_name               = local.key_name
  user_data              = data.template_file.bootstrap.rendered
  subnet_id              = aws_subnet.simple.id
  vpc_security_group_ids = [aws_security_group.simple.id]

  depends_on = [aws_efs_mount_target.efs_simple]
}

#===========================================================================================================================
