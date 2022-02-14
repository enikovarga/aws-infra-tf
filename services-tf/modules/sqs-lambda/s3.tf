resource "aws_s3_bucket" "artifact-bucket" {
  bucket = var.artifact_bucket
}

resource "aws_s3_bucket" "data-bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket     = aws_s3_bucket.data-bucket.bucket
  depends_on = [aws_sqs_queue.this, aws_sqs_queue.dlq, aws_sqs_queue_policy.this]

  queue {
    queue_arn     = aws_sqs_queue.this.arn
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = ""
  }
}
