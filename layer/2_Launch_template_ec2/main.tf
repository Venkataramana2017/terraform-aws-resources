module "tcbuk_lauch_template" {
  source = "../../module/terraform-aws-resources-module/module/launch_template"

  providers = {
    aws = aws.tcbuk
  }

  core_lt_name               = "tcbuk-${lower(terraform.workspace)}-lt-tcb"
  core_lt_ami                = lookup(var.ami_id, terraform.workspace)
  instance_detail_monitoring = var.instance_detail_monitoring
  ebs_optimized              = var.ebs_optimized
  key_name                   = lookup(var.key_name, terraform.workspace)
  lt_security_group_ids       = data.terraform_remote_state.network_security_layer.outputs.core_ec2_sg_id
  asg_subnet_ids              = data.terraform_remote_state.network_core_layer.outputs.appsubnet_ids
  iam_instance_profile        = data.terraform_remote_state.network_security_layer.outputs.instance_profile_arn
  asg_name                     = "tcbuk-${lower(terraform.workspace)}-asg-tcb"
  asg_min_size                 = lookup(var.asg_min_size, terraform.workspace)
  asg_max_size                 = lookup(var.asg_max_size, terraform.workspace)
  desired_capacity             = lookup(var.asg_desired_capacity, terraform.workspace)
  health_check_type            = var.health_check_type
  health_check_grace_period    = var.health_check_grace_period
  default_cooldown             = var.default_cooldown
  termination_policies         = var.termination_policies
  enabled_metrics              = var.enabled_metrics
  suspended_processes          = split(",",var.suspended_processes)
  #Extended parameters for launch template
  on_demand_allocation_strategy = var.on_demand_allocation_strategy
  on_demand_base_capacity       = lookup(var.on_demand_base_capacity, terraform.workspace)
  on_demand_percentage_above_base_capacity = lookup(var.on_demand_percentage_above_base_capacity, terraform.workspace)
  spot_allocation_strategy     = var.spot_allocation_strategy
  spot_max_price               = lookup(var.spot_max_price, terraform.workspace)
  launch_template_version      = var.launch_template_version
  spot_instance_type1          = element(split(",", lookup(var.spot_instance_types, terraform.workspace)),0)
  spot_instance_type2          = element(split(",", lookup(var.spot_instance_types, terraform.workspace)),1)
  spot_instance_type3          = element(split(",", lookup(var.spot_instance_types, terraform.workspace)),2)
  ec2_name_tag             = "tcbuk-${lower(terraform.workspace)}-ec2-tcb"
  environment_tag          = lower(terraform.workspace)
  application_category_tag = var.application_category_tag
  application_tag          = var.application_tag
  brand_tag                = var.brand_tag
  project_tag              = var.project_tag
  resource_to_tag          = "volume"
  instance_shutdown_behaviour = var.instance_shutdown_behaviour
  asg_service_linked_role_arn = var.asg_service_linked_role_arn
}