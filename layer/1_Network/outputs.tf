output "appsubnet_ids" {
  value = module.tcbuk_network_vpc.appsubnet_ids
}

output "dbsubnet_ids" {
  value = module.tcbuk_network_vpc.dbsubnet_ids
}

output "pubsubnet_ids" {
  value = module.tcbuk_network_vpc.pubsubnet_ids
}

output "vpc_id" {
  value = module.tcbuk_network_vpc.vpc_id
}

output "availability_zones" {
  value = module.tcbuk_network_vpc.availability_zones
}


output "vpc_cidr" {
  value = module.tcbuk_network_vpc.vpc_cidr
}