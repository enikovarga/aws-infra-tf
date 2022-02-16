# aws-infra-tf

Sample infrastructure code for building AWS resources

### infra-state
Module to create terraform lock table and bucket for storing state files.

### services-tf
Main terraform module to create AWS services. Each service is defined as a child modules.

| module     | module description                             | input variable | variable description|
|------------|------------------------------------------------|----------------|---------------------|
| sqs-lambda | Lambda function with SQS queue trigger         | artifact_bucket|                     |
|            |                                                | artifact_path  |                     |
|            |                                                | s3_bucket_name |                     |
| redshift   | Simple redshift cluster provisioned with a VPC | master_username|                     |
|            |                                                | master_password|                     |


