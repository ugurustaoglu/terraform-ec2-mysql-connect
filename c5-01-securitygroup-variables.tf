# Security Group Variables
variable "sg_bastion_host_ingress_rules" {type=list}
variable "sg_bastion_host_ingress_cidr_blocks" {type=list}
variable "sg_bastion_host_egress_rules" {type=list}

variable "sg_ec2_ingress_rules" {type=list}
variable "sg_ec2_ingress_cidr_blocks" {type=list}
variable "sg_ec2_egress_rules" {type=list}

variable "sg_mysql_ingress_rules" {type=list}
variable "sg_mysql_ingress_cidr_blocks" {type=list}
variable "sg_mysql_egress_rules" {type=list}