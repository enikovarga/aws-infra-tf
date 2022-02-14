bucket         = "shared-infra-terraform-state-ev"
session_name   = "terraform"
dynamodb_table = "shared-infra-terraform-state-lock-ev"
region         = "eu-west-1"
encrypt        = true
key            = "environments/dev/vpc.tfstate"
