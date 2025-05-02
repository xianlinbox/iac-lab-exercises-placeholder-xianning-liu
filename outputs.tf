output "ecr_url" {
  description = "The ECR URL."
  value       = module.ecs.ecr_url
}

output "website_url" {
  description = "The website URL."
  value       = format("http://%s/users", aws_lb.lb.dns_name)
}