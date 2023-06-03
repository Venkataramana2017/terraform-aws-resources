# Below are the list of variable
variable "on_demand_percentage_above_base_capacity" {
    description = "On-Demand above Base capacity to launch in Percentage"
    type        = map

    default = {
     DEV      = "100"
     TEST     = "100"
      PROD    = "100"
    }
  }
variable "spot_allocation_strategy" {
    description = "Spot Instance allocation startegy in Percentage"
    default = "capacity-optimized"
  }

variable "spot_max_price" {
    description = "Spot Instance Instance Max Price"
    type        = map

    default = {
      DEV     = ""
      TEST     = ""
      PROD     = ""
    }
  }

variable "launch_template_version" {
    description = "launch template version to use in Auto-Scaling Group"
    default = "$Latest"
  }

variable "resource_to_tag" {
  description = "Resource to attach Tag while launching Instance/Volume"
  default = "volume"
}

variable "instance_interruption_behavior" {
  description = "Spot instance interruption behaviour ie., STOP TERMINATE HYBERNATE"
  default = "TERMINATE"
 }

variable "asg_service_linked_role_arn" {
   description = "Service Linked Role for Auto-Scaling Group"
    default =  ""
  }

variable "health_check_type" {
  description = "Health check type"
  default     = "EC2"
}

variable "health_check_grace_period" {
  description = "Health check grace period"
  default     = "30"
}

variable "default_cooldown" {
  description = "Default cooldown"
  default     = "300"
}

variable "termination_policies" {
  description = "Termination policies"
  default     = ["OldestInstance"]
}

variable "enabled_metrics" {
  description = "Enabling extra metrics"
  default     = ["GroupTotalInstances"]
}

variable "suspended_processes" {
  description = "List of processes to enable/disable during autoscaling"
  default = "ScheduledActions"
}

variable "asg_min_size" {
  description = "Autoscaling group minimum number of instances"
  type        = map

  default = {
    DEV     = "1"
    TEST     = "1"
    PROD    = "1"
  }
}

variable "asg_max_size" {
  description = "Autoscaling group maximum number of instances"
  type        = map

  default = {
    DEV     = "1"
    TEST     = "1"
    PROD    = "1"
  }
}

variable "asg_desired_capacity" {
  description = "Autoscaling group desired number of instances"
  type        = map

  default = {
    DEV     = "1"
    TEST     = "1"
    PROD    = "1"

  }
}

variable "autoscaling_name" {
  default = "asg-tcbuk"
}

variable "stickiness_type" {
  description = "ALB target group stickiness type"
  default     = "lb_cookie"
}

variable "cookie_duration" {
  description = "The time period, in seconds, during which requests from a client should be routed to the same target"
  default     = "86400"
}

variable "enable_stickiness" {
  description = "Boolean to enable/disable stickiness"
  default     = false
}


variable "instance_detail_monitoring" {
  description = "Enables/disables detailed monitoring"
  default =  "false"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"

  default =  "true"
}

variable "application_tag" {
  description = "Application Tag"
  default     = "tcbuk"
}

variable "application_category_tag" {
  description = "Application Category Tag"
  default     = "tcbuk"
}

variable "brand_tag" {
  description = "Brand Tag"
  default     = "all"
}

variable "project_tag" {
  description = "values for project tags"

  default = "tcbuk"
}

variable "estimated_instance_warmup" {
  description = "instance warmup time"
  default = "300"

}

variable "target_value_cpu" {
  description = "target value"
  default = "40"
}

variable "target_value_memory" {
  description = "target value"
  default = "80"

}


variable "key_name" {
  description = "target value"
  type        = map

  default = {
    DEV      = "jenkins-iam-key"
    TEST     = "jenkins-iam-key"
    PROD     = "jenkins-iam-key"
  }
}
variable "ami_id" {
  description = "target value"
  type        = map

  default = {
    DEV      = "ami-03d797efb63fa1985"
    TEST     = "ami-03d797efb63fa1985"
    PROD     = "ami-03d797efb63fa1985"
  }
}


variable "spot_instance_types" {
  description = "Spot Instance type List for Auto-Scaling Group. CAUTION : Make sure that there are 7 commas(,) for every environment as the values are picked up using the element function. Failing this criterion, the instances types would be overridden. Any addition or deletion of instance typesneed to be done within the commas."
  type        = map

  default = {
    DEV     = "t2.micro,t2.small,,,,,,"
    TEST    = "t2.micro,t2.small,,,,,,"
    PROD   = "t2.small,t2.small,,,,,,"
  }
}
