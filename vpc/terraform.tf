terraform {
  backend "s3" {}
  required_version = "~> 1.1.5"
}

provider "aws" {
  region = "eu-west-1"
}
