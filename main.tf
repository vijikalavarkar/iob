terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "iob-state-bucket-001"
    key    = "iob.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}


# VPC_Module
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_tag = var.vpc_tag
}

# Internet_Gateway_Module
module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
  internet_gateway_tag = var.internet_gateway_tag
}

# Subnet_Module
module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  subnet1_cidr = var.subnet1_cidr
  subnet1_az = var.subnet1_az
  subnet1_tag = var.subnet1_tag
  subnet2_cidr = var.subnet2_cidr
  subnet2_az = var.subnet2_az
  subnet2_tag = var.subnet2_tag
  subnet3_cidr = var.subnet3_cidr
  subnet3_az = var.subnet3_az
  subnet3_tag = var.subnet3_tag
}

# Route_Table_Module
module "route_tables" {
  source = "./modules/route_tables"
  vpc_id = module.vpc.vpc_id
  iob_public_rt_cidr = var.iob_public_rt_cidr
  iob_public_rt_tag = var.iob_public_rt_tag
  internet_gateway_id = module.internet_gateway.internet_gateway_id
}

# Route_Table_Associations_Module
module "route_table_associations" {
  source = "./modules/route_table_associations"
  subnet1_id = module.subnets.subnet1_id
  subnet2_id = module.subnets.subnet2_id
  subnet3_id = module.subnets.subnet3_id
  iob_public_rt_id = module.route_tables.iob_public_rt_id
}

# Security_Group_Module
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  security_group_tag = var.security_group_tag
}

