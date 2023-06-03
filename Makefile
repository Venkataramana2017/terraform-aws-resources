# Makefile to kickoff terraform.
# ####################################################
#
LAYERS = tcbuk-network
STATEBUCKET = tf-state-backend-venkat
STATELOCKTABLE = terraform-lock-db
#STATEKEY = 1_Network/$(LAYER)/terraform.tfstate
STATEKEY  =  $(LAYER)/terraform.tfstate
#STATEKEY = 2_Launch_template_ec2/$(LAYER)/terraform.tfstate
#STATEKEY = 3_Security_group/$(LAYER)/terraform.tfstate

STATEREGION = eu-central-1


# # Before we start test that we have the mandatory executables available wich git and terrafrom is aviable or not to check this command 
	EXECUTABLES = git terraform
	K := $(foreach exec,$(EXECUTABLES),\
		$(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH, consider apt-get install $(exec)")))

## && for continousation for commands.
.PHONY: plan

first-run:
	@echo "initialize remote state file"
	cd layer/$(LAYER) && \
	terraform init -backend-config="bucket=$(STATEBUCKET)" -backend-config="key=$(STATEKEY)" -backend-config="dynamodb_table=$(STATELOCKTABLE)" -backend-config="region=$(STATEREGION)"
	

init:
	@echo "initialize remote state file"
	cd layer/$(LAYER) && \
	terraform workspace select $(WORKSPACE) || terraform workspace new $(WORKSPACE) && \
	terraform init --force-copy -backend-config="bucket=$(STATEBUCKET)" -backend-config="key=$(STATEKEY)" -backend-config="dynamodb_table=$(STATELOCKTABLE)" -backend-config="region=$(STATEREGION)" 

validate: init
	@echo "running terraform validate"
	cd layer/$(LAYER) && \
	terraform validate -no-color

plan: validate
	@echo "running terraform plan"
	cd layer/$(LAYER) && \
	terraform plan -no-color

apply: plan
	@echo "running terraform apply"
	cd layer/$(LAYER) && \
	terraform apply -auto-approve -no-color

plan-destroy: validate
	@echo "running terraform plan -destroy"
	cd layer/$(LAYER) && \
	terraform plan -destroy -no-color

apply-destroy: init
	@echo "running terraform destroy"
	cd layer/$(LAYER) && \
    terraform apply -destroy -auto-approve -no-color


	
