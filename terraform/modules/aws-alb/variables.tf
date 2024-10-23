variable "lb_name" {
  type    = string
  default = "test-lb"

  description = "Name of LB"
}

variable "lb_type" {
  type    = string
  default = "application"

  description = "Type of LB"
}

variable "lb_security_groups" {
  type = list(string)

  description = "List of LB security groups"
}

variable "lb_subnets" {
  type = list(string)

  description = "List of LB subnets"
}

variable "lb_target_group_name" {
  type    = string
  default = "tg-default"

  description = "Name of target group to be created"
}

variable "lb_target_group_type" {
  type    = string
  default = "lambda"

  description = "Target group type"
}

variable "lb_vpc_id" {
  type    = string
  default = "test-lb"

  description = "ID of the VPC where LB resides"
}

variable "lb_lambda_arn" {
  type = string

  description = "ARN of the Lambda where traffic will go"

}

variable "lb_lambda_name" {
  type = string

  description = "Name of the Lambda where traffic will go"
}
