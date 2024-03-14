module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "ajay_key_pair"
  monitoring             = true
  vpc_security_group_ids = ["sg-051e70eebb757a35c"]
  subnet_id              = "subnet-bdb5c9e2"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}