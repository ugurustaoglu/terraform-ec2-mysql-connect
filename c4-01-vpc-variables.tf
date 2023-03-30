# VPC Variables
variable "vpc_name" {}
variable "vpc_cidr_block" {}
variable "vpc_azs" {type=list}
variable "vpc_public_subnets" {type=list}
variable "vpc_private_subnets" {type=list}
variable "vpc_database_subnets" {}
variable "vpc_enable_nat_gateway" {}
variable "vpc_single_nat_gateway" {}
variable "vpc_enable_dns_hostnames" {}
variable "vpc_enable_dns_support" {}
variable "vpc_tag_public_subnets" {}
variable "vpc_tag_private_subnets" {}
variable "vpc_tag_database_subnets" {}
variable "vpc_create_database_subnet_group" {}