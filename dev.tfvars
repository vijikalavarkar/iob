aws_region = "us-east-1"

# vpc_contents
vpc_cidr = "10.0.0.0/16"
vpc_tag  = "iob-vpc-dev"

# internet_gateway
internet_gateway_tag = "iob-internet-gateway"


# subnet
subnet1_cidr = "10.0.1.0/24"
subnet1_az   = "us-east-1a"
subnet1_tag  = "iob_subnet_1_1a_dev"


subnet2_cidr = "10.0.2.0/24"
subnet2_az   = "us-east-1a"
subnet2_tag  = "iob_subnet_2_1a_dev"

subnet3_cidr = "10.0.3.0/24"
subnet3_az   = "us-east-1b"
subnet3_tag  = "iob_subnet_3_1b_dev"

# route table
iob_public_rt_cidr = "0.0.0.0/0"
iob_public_rt_tag  = "iob_public_route_table_dev"

# security group
security_group_tag = "iob_security_group_dev"

# ami
ami           = "ami-0a7d80731ae1b2435"
instance_type = "t2.micro"
key_name      = "TKey"
instance_tag  = "iob_instance_dev"

# dynamodb
dynamodb_table_name = "iob_dynamodb_table"
billing_mode = "PAY_PER_REQUEST"
hash_key = "LockID"












