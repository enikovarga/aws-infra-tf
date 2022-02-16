# Terraform state file setup.
# Create an S3 bucket to store terraform state.
resource "aws_s3_bucket" "shared-infra_terraform_state" {
  bucket = "shared-infra-terraform-state-ev"

  lifecycle {
    prevent_destroy = true
  }
}

# Terraform lock table
resource "aws_dynamodb_table" "terraform_shared-infra_state_lock" {
  name           = "shared-infra-terraform-state-lock-ev"
  hash_key       = "LockID"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}
