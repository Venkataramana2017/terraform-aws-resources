variable "region" {
  description = "AWS region that will be used to create resources in."
  default     = "eu-central-1"
}


variable "tcbuk_account_id" {
  type = map
  description = "AWS account number for tcb-infra"
  default = {
    "default" = ""
     dev   = "902303113716"
     test  = "902303113716"
   }
}

#data "terraform_remote_state" "network_core_layer" {
 # backend = "s3"

  #config = {
   # bucket = "test-topcashback-terraform-state"
   # key    = "env:/${terraform.workspace}/TCBUK_network/terraform.tfstate"
   # region = "eu-west-1"
  #}
#}