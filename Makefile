WORKDIR = $(shell pwd)

## Services
init:
	cd $(WORKDIR)/services-tf && rm -rf .terraform/
	cd $(WORKDIR)/services-tf && terraform init -backend=true -backend-config=environments/dev/backend.tfvars

plan:
	cd $(WORKDIR)/services-tf && terraform plan --var-file=environments/dev/terraform.tfvars

apply:
	cd $(WORKDIR)/services-tf && terraform apply -auto-approve --var-file=environments/dev/terraform.tfvars

destroy:
	cd $(WORKDIR)/services-tf && terraform destroy --var-file=environments/dev/terraform.tfvars

build: init plan apply
