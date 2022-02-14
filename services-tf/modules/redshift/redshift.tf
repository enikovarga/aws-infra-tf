resource "aws_redshift_cluster" "default" {
  # cluster
  cluster_identifier = "redshift-${var.environment}-cluster"
  database_name      = "default"
  master_username    = var.master_username
  master_password    = var.master_password
  node_type          = "dc2.large"
  cluster_type       = "multi-node"
  number_of_nodes    = 1
  skip_final_snapshot = "true"

  # network
  cluster_subnet_group_name = aws_redshift_subnet_group.redshift_subnet_group.id
  vpc_security_group_ids    = [aws_security_group.redshift.id]

  # permissions
  publicly_accessible = "false"
  iam_roles           = [aws_iam_role.redshift_role.arn]
}


resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  name       = "redshift-subnet-group"
  subnet_ids = data.aws_subnets.subnets.ids
}
