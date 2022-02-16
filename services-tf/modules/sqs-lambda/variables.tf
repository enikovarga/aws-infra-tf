variable "s3_bucket_name" {
  type        = string
  description = "Bucket that S3 notification will be added to"
}

variable "artifact_bucket" {
  type = string
}

variable "artifact_path" {
  type        = string
  description = "Local path containing deployable artifacts"
}
