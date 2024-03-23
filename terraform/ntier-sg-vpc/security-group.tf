resource "aws_security_group" "sg_oportun_fin_web" {
  vpc_id      = aws_vpc.vpc-oportun-fin-ntier.id
  description = "virtual network dedicated to web"
  tags = {
    "Name" = "sg_oportun_fin_ntier_web"
    "Env"  = "dev"
  }
  depends_on = [aws_vpc.vpc-oportun-fin-ntier]
}

resource "aws_security_group_rule" "sg_oportun_fin_web_outbound_rule" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  description       = "80 port ingress"
  security_group_id = aws_security_group.sg_oportun_fin_web.id
}