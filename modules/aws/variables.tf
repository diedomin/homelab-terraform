variable "aws_region" {
  description = "The AWS region where all resourcess will be created"
  default     = ""
}

variable "env" {
  description = "Environment"
  default     = ""
}

variable "s3_tfstate_bucket_name" {
  description = "Name of the S3 bucket to store the Terraform state"
  default     = ""
}

variable "dynamodb_tfstate_table_name" {
  description = "DynamoDB table name for state locking"
  default     = ""
}
