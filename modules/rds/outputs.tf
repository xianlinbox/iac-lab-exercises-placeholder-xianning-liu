output "db_address" {
  description = "the db address"
  value       = aws_db_instance.database.address
}

output "db_secret_arn" {
  description = "the password arn"
  value       = data.aws_secretsmanager_secret.db.arn
}

output "db_secret_key_id" {
  description = "the kms key use to encrypt password"
  value       = data.aws_secretsmanager_secret.db.kms_key_id
}