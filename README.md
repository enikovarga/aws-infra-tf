# aws-infra-tf

### infra-state

### vpc
cd vpc
terraform init -backend=true -backend-config=environments/dev/backend.tfvars
terraform plan --var-file=environments/dev/terraform.tfvars
terraform apply --var-file=environments/dev/terraform.tfvars


### services-tf
cd services
terraform init -backend=true -backend-config=environments/dev/backend.tfvars
terraform plan --var-file=environments/dev/terraform.tfvars
terraform apply --var-file=environments/dev/terraform.tfvars



| module | description |
| ------ | ----------- | 
| ------ | ----------- | 

