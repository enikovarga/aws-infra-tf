provider "aws" {
  region      = "eu-west-1"
  max_retries = 1 # this avoids Terraform to hang in case of wrong credentials
}
