# DynamoDB for Terraform state
resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.dynamodb_tfstate_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = var.dynamodb_tfstate_table_name
    Environment = var.env
    Terraform   = "true"
  }
}
