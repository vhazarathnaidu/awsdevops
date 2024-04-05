resource "aws_vpc" "vpc-oportun-fin-ntier" {

  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "vpc-oportun-fin-ntier"
    "Env"  = "dev"
  }
}

resource "aws_subnet" "subnets" {
  count      = length(var.subnets_cidrs)
  vpc_id     = aws_vpc.vpc-oportun-fin-ntier.id
  cidr_block = var.subnets_cidrs[count.index]
  tags = {
    Name = "subnet ${count.index}"
  }
}