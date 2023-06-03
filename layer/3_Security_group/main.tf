module "tcbuk_sg" {
  source = "../../module/terraform-aws-resources-module/module/security-group"

  providers = {
    aws = aws.tcbuk
  }
  vpc_cidr              =  lookup(var.vpc_cidr, terraform.workspace)
  cidr_blocks           =  lookup(var.vpc_cidr, terraform.workspace)
  #environment 		      =  lower(terraform.workspace)
  #common_tags 		  		= {
	#	    	Environment 	= lower(terraform.workspace)
	#	}
}