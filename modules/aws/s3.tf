#S3 remote terraform state
module "s3_tfstate_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "4.5.0"

  bucket = var.s3_tfstate_bucket_name
  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  block_public_acls = true
  ignore_public_acls = true
  restrict_public_buckets = true

  versioning = {
    enabled = true
  }

  tags = {
    Name        = var.s3_tfstate_bucket_name
    Environment = var.env
    Terraform   = "true"
  }
}
