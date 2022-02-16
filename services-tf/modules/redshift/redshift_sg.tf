resource "aws_security_group" "redshift" {
  name        = "infra-redshift"
  description = "A security group that allows inbound access to an Amazon Redshift cluster (TCP 5439)."
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Redshift traffic - TCP 5439"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
