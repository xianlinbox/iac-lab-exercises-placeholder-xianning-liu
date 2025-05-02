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

variable "db_address" {
  type        = string
  description = "The db address for the app"
}

variable "db_name" {
  type        = string
  description = "The db name for the app"
}

variable "db_username" {
  type        = string
  description = "The db user for the app"
}

variable "db_secret_arn" {
  type        = string
  description = "The db password"
}

variable "db_secret_key_id" {
  type        = string
  description = "The db password decrypt key"
}
