# AWS EC2 Instance Terraform Module
# Private Instances - EC2 Instances that will be used to connect to mysql db

module "ec2_private" {
  depends_on = [aws_key_pair.ec2-pem, module.db_mysql]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"
  count = length(module.vpc.private_subnets)

  name                   = "${var.environment}-Private-${count.index}"
  ami                    = data.aws_ami.amz_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              =  module.vpc.private_subnets[count.index]
  vpc_security_group_ids = [module.sg_private_ec2.this_security_group_id]
  user_data = <<-EOF
      #!/bin/bash
      sudo yum update -y
      sudo yum install mariadb -y
      mysql -h ${module.db_mysql.db_instance_address} -uadmin -p${random_password.master.result} -e "CREATE USER ${var.db_username} IDENTIFIED BY '${var.db_password}';"
    EOF
  tags = local.common_tags
}