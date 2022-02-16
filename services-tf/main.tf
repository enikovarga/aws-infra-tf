module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-${var.environment}"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
}

module "redshift" {
  source = "./modules/redshift"

  environment     = var.environment
  vpc_id          = module.vpc.vpc_id
  master_username = var.master_username
  master_password = var.master_password
}

module "sqs-lambda" {
  source = "./modules/sqs-lambda"

  artifact_bucket = var.artifact_bucket
  artifact_path   = var.artifact_path
  s3_bucket_name  = var.s3_bucket_name
}