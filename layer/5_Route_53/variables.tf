# Below are the list of variable

variable "vpc_cidr" {
  description = "IP range of Core VPC"
  type        = map

  default = {
    dev     = "10.5.48.0/21"
    test     = "10.5.56.0/21"
     }
}

variable "subnets_public_cidrs" {
  description = "Subnet list with IP ranges"
  type        = map
  default = {
    dev = ["10.5.48.0/24","10.5.49.0/24"]
    test = ["10.5.56.0/24","10.5.57.0/24"]
  }
 }
variable "subnets_private_cidrs" {
  description = "Subnet list with IP ranges"
  type        = map
  default = {
   dev = ["10.5.50.0/23","10.5.52.0/23"]
    test = ["10.5.58.0/23","10.5.60.0/23"]
   
  }
}

variable "subnets_db_cidrs" {
  description = "Subnet list with IP ranges"
  type        = map
  default = {
   dev = ["10.5.54.0/24","10.5.55.0/24"]
    test = ["10.5.62.0/24","10.5.63.0/24"]
     }

}

variable "availability_zones" {
  description = "Availability zones that are going to be used for the subnets"
  type        = map

  default = {
   dev    = ["eu-central-1a", "eu-central-1b"]
    test  = ["eu-central-1a", "eu-central-1b"]
     }
}