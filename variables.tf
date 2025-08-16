# main-region
variable "aws_region" {}

# vpc-contents
variable "vpc_cidr" {}
variable "vpc_tag" {}

# internet gateway
variable "internet_gateway_tag" {}

# subnet
variable "subnet1_cidr" {}
variable "subnet1_az" {}
variable "subnet1_tag" {}

variable "subnet2_cidr" {}
variable "subnet2_az" {}
variable "subnet2_tag" {}

variable "subnet3_cidr" {}
variable "subnet3_az" {}
variable "subnet3_tag" {}

# route table
variable "iob_public_rt_cidr" {}
variable "iob_public_rt_tag" {}

# security group
variable "security_group_tag" {}

