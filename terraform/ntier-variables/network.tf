resource "aws_vpc" "ntier-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "tf-ntier-vpc"
    "Env"  = "dev"
  }
}

resource "aws_subnet" "subnets" {
  count      = length(var.subnets_cidrs)
  vpc_id     = aws_vpc.ntier-vpc.id
  cidr_block = var.subnets_cidrs[count.index]
   tags = {
    Name = "subnet ${count.index}"
  }
}