variable "prefix" {
  type        = string
  description = "the resource tag prefix"
}
variable "region" {
  type        = string
  default     = "us-east-2"
  description = "region host the resources"
}

variable "vpc_id" {
  type        = string
  description = "the id of VPC ECS will running in "
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "the subnets of ECS cluster will running in "
}

variable "alb_target_group_arn" {
  type        = string
  description = "The load balancer target group"
}

variable "alb_security_group_id" {
  type        = string
  description = "The load balancer security group id"
}


