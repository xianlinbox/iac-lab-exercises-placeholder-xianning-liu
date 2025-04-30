variable "prefix" {
  type        = string
  description = "the resource tag prefix"
}
variable "region" {
  type        = string
  default     = "us-east-2"
  description = "region host the resources"
}
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "number_of_public_subnets" {
  type        = number
  default     = 2
  description = "count of public subnets"
}


variable "number_of_private_subnets" {
  type        = number
  default     = 2
  description = "count of private subnets"
}

variable "number_of_secure_subnets" {
  type        = number
  default     = 2
  description = "count of secure subnets"
}
