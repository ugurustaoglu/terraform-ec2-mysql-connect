# AWS EC2 Security Group Terraform Module
# Security Group for private mysql
module "sg_private_mysql" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"

  name = "private-mysql-sg"
  description = "All deny"
  vpc_id = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = var.sg_mysql_ingress_rules
  ingress_cidr_blocks = var.sg_mysql_ingress_cidr_blocks
  # Egress Rule - all-all open
  egress_rules = var.sg_ec2_egress_rules
  tags = local.common_tags
}