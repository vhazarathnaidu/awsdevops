
resource "aws_security_group" "sg_oportun_fin_web" {
  name        = "websg"
  description = "open 22 and 80 port for all"
  vpc_id      = aws_vpc.vpc-oportun-fin-ntier.id

  ingress {
    cidr_blocks = [local.anywhere]
    description = "open ssh port"
    from_port   = local.ssh
    protocol    = local.tcp
    to_port     = local.ssh
  }

  ingress {
    cidr_blocks = [local.anywhere]
    description = "open http port"
    from_port   = local.http
    protocol    = local.tcp
    to_port     = local.http
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "websg"
  }

  depends_on = [aws_route_table.privatert, aws_route_table.publicrt]
}
