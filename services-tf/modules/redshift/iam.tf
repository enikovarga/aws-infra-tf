resource "aws_iam_role" "redshift_role" {
  name               = "infra-redshift-${var.environment}-role"
  assume_role_policy = data.aws_iam_policy_document.redshift_assume_role_policy.json

  inline_policy {
    name   = "infra-redshift-${var.environment}-policy"
    policy = data.aws_iam_policy_document.redshift_inline_policy.json
  }
}

data "aws_iam_policy_document" "redshift_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = [
        "redshift.amazonaws.com",
      ]
    }
  }
}

data "aws_iam_policy_document" "redshift_inline_policy" {
  statement {
    actions = [
      "s3:GetObject*",
      "s3:GetBucket*",
      "s3:List*"
    ]
    resources = [
      "*"
    ]
  }

  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups"
    ]
    resources = [
      "*"
    ]
  }
}
