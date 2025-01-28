output "s3_bucket_name" {
  value       = module.s3_tfstate_bucket.s3_bucket_id
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_lock.name
}

output "kms_key_id" {
  value       = aws_kms_key.sops_key.key_id
}