#===========================================================================================================================

resource "aws_efs_file_system" "efs_simple" {
  depends_on = [aws_security_group.simple]
}

resource "aws_efs_mount_target" "efs_simple" {
  file_system_id  = aws_efs_file_system.efs_simple.id
  subnet_id       = aws_subnet.simple.id
  security_groups = [aws_security_group.simple.id]
}

resource "aws_route53_record" "efs_simple" {
  zone_id = local.zone_id
  name    = replace("efs_simple.${local.zone_name}", "_", "-")
  type    = "CNAME"
  ttl     = "64"
  records = [aws_efs_mount_target.efs_simple.dns_name]
}

#===========================================================================================================================
