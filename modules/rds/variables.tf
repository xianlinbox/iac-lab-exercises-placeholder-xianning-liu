variable "prefix" {
  type        = string
  description = "the resource tag prefix"
}

variable "vpc_id" {
  type        = string
  description = "the id of VPC DB will running in "
}

variable "db_username" {
  type        = string
  description = "Database username"
}

variable "db_name" {
  type        = string
  description = "Database name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Database name"
}

variable "allow_security_group_ids" {
  type        = list(string)
  description = "security group allow to access the db"
}