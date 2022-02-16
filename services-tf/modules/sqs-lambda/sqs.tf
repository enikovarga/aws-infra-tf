resource "aws_sqs_queue" "this" {
  name                       = "lambda-notification-queue"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 864000
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 1800
  redrive_policy             = <<EOF
  {
    "deadLetterTargetArn": "${aws_sqs_queue.dlq.arn}",
    "maxReceiveCount": 5
  }
  EOF
}

resource "aws_sqs_queue_policy" "this" {
  queue_url = aws_sqs_queue.this.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.this.arn}",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "arn:aws:s3:::${local.s3_bucket_name}" }
      }
    }
  ]
}
POLICY
}


resource "aws_sqs_queue" "dlq" {
  name                       = "lambda-notification-dlq"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 1209600
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 300
}
