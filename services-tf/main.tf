#module "redshift" {
#    source = "./modules/redshift"
#
#    environment = var.environment
#    vpc_id = var.vpc_id
#    master_username = var.master_username
#    master_password = var.master_password
#}


module "sqs-lambda" {
    source = "./modules/sqs-lambda"

    artifact_bucket = var.artifact_bucket
    artifact_path  = var.artifact_path
    s3_bucket_name = var.s3_bucket_name
}