data "archive_file" "sample" {
  type        = "zip"
  source_file = "../python-sample/hello-world.py"
  output_path = "../python-sample/hello-world.zip"
}

resource "aws_s3_object" "sample" {
  bucket      = aws_s3_bucket.artifact-bucket.bucket
  key         = "${var.artifact_path}/hello-world.zip"
  source      = data.archive_file.sample.output_path
  source_hash = filemd5(data.archive_file.sample.output_path)
}

resource "aws_lambda_function" "this" {
  s3_bucket        = aws_s3_object.sample.bucket
  s3_key           = aws_s3_object.sample.key
  source_code_hash = filebase64sha256(data.archive_file.sample.output_path)

  function_name = "lambda-function"
  role          = aws_iam_role.lambda_role.arn
  handler       = "hello-world.handler"
  runtime       = "python3.8"
  memory_size   = "128"
  timeout       = "60"
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/lambda-function"
  retention_in_days = 1
}

resource "aws_lambda_event_source_mapping" "sqs-trigger" {
  event_source_arn = aws_sqs_queue.this.arn
  function_name    = aws_lambda_function.this.arn
}
