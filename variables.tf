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
