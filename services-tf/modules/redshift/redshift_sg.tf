resource "aws_security_group" "redshift" {
  name        = "infra-redshift"
  description = "Allow TLS from VPN and local communication"
  vpc_id      = var.vpc_id

  ingress {
    description = "all from self"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    description = "TLS from VPN"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
