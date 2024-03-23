resource "aws_vpc" "vpc-oportun-fin-ntier" {

  cidr_block = vpc-cidr

  tags = {
    "Name" = "vpc-oportun-fin-ntier"
    "Env"  = "dev"
  }
}

resource "aws_subnet" "subnets" {
  count      = length(subnets_cidrs)
  vpc_id     = aws_vpc.ntier-vpc.id
  cidr_block = subnets_cidrs[count.index]
  tags = {
    Name = "subnet ${count.index}"
  }
}