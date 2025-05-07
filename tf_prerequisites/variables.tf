variable "prefix" {
  type        = string
  default = "xianning-liu-iac-lab"
  description = "the resource tag prefix"
}
variable "region" {
  type        = string
  default = "us-east-2"
  description = "region host the resources"
}

variable "repo_name" {
  type        = string
  default = "xianlinbox/iac-lab-exercises-placeholder-xianning-liu"
  description = "the repo name"
}