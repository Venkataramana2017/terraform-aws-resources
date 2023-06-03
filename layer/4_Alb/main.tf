module "tcbuk_network_vpc" {
  source = "../../../module/tcbuk-global-terraform-module-network"

  providers = {
    aws = aws.tcbuk
  }

  vpc_cidr   				= lookup(var.vpc_cidr, terraform.workspace)
  environment 			    = lower(terraform.workspace)
  public       				= lookup(var.subnets_public_cidrs, terraform.workspace)
  private_app  				= lookup(var.subnets_private_cidrs, terraform.workspace)
  private_db 				= lookup(var.subnets_db_cidrs, terraform.workspace)
  availability_zones 		= lookup(var.availability_zones, terraform.workspace)
  vpc_name           		= "tcbuk-${lower(terraform.workspace)}-vpc"
  vpc_flow_log_group_name 	= "vpc-flowlog"
  sub_services_names 		= {
			public0       	= "pubsn-team_a-az-1a"
			public1			= "pubsn-team_b-az-1b"
			private_app0  	= "prisn-team_a-az-1a"
			private_app1  	= "prisn-team_b-az-1b"
			private_db0 	= "pridbsn-team_a-az-1a"
			private_db1 	= "pridbsn-team_b-az-1b"

  }
  common_tags 				= {
			Environment 	= lower(terraform.workspace)
		}
}