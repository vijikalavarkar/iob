terraform {
  backend "s3" {
    bucket = "iob-state-bucket-001"
    key    = "iob_support.tfstate"
    region = "us-east-1"
  }
}


resource "aws_instance" "demo_ec2" {
  ami           = "ami-0a7d80731ae1b2435"
  instance_type = "t2.micro"
  key_name      = "TKey"
  subnet_id     = data.aws_subnet.iob_subnet_1_1a.id
  vpc_security_group_ids = [ data.aws_security_group.iob_security_group.id ]
  associate_public_ip_address = true

  tags = {
    Name = "demo_ec2"
  }
}