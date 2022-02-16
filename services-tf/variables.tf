variable "environment" {
  type    = string
}

# redshift
variable "master_username" {
  type = string
}

variable "master_password" {
  type = string
}

# sqs-lambda
variable "artifact_bucket" {
  type = string
}

variable "artifact_path" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}

