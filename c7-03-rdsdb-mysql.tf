module "db_mysql" {
  source  = "terraform-aws-modules/rds/aws"
  identifier = var.db_identifier
  engine               = "mysql"
  engine_version       = "8.0.32"
  major_engine_version = "8.0"
  family = "mysql8.0"
  instance_class = "db.t3.micro"
  allocated_storage = var.db_size

  db_name     = var.db_name
  username = "admin"
  password = random_password.master.result
  port     = var.db_port
  create_random_password = false
  iam_database_authentication_enabled = false
  vpc_security_group_ids = [module.sg_private_mysql.this_security_group_id]
  multi_az = false
  db_subnet_group_name = module.vpc.database_subnet_group_name
  skip_final_snapshot = "true"

  }

  resource "random_password" "master" {
    length = 10
    special          = true
    override_special = "!#$%&*()-_=+[]{}<>:?"
}