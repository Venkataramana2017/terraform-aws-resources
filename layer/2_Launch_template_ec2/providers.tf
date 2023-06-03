 provider "aws" {
  alias               = "tcbuk"
  region              = var.region
  allowed_account_ids = [lookup(var.tcbuk_account_id, terraform.workspace)]


 #assume_role {
  #  role_arn = "arn:aws:iam::${lookup(var.tcbuk_account_id, terraform.workspace)}:role/annapurna1"
  #}
} 


