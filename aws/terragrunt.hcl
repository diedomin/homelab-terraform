include {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../modules/aws" 
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("root.hcl"))

  aws_region                  = local.common_vars.locals.aws_region
  s3_tfstate_bucket_name      = local.common_vars.locals.s3_tfstate_bucket_name
  env                         = local.common_vars.locals.env
  dynamodb_tfstate_table_name = local.common_vars.locals.dynamodb_tfstate_table_name
}

inputs = {
  aws_region                  = local.aws_region
  s3_tfstate_bucket_name      = local.s3_tfstate_bucket_name
  dynamodb_tfstate_table_name = local.dynamodb_tfstate_table_name
  env                         = local.env
}

#Remote state S3
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config = {
    profile = "default"
    bucket  = local.s3_tfstate_bucket_name
    region  = local.aws_region
    encrypt = true
    skip_bucket_versioning = false
    dynamodb_table = local.dynamodb_tfstate_table_name
    key = "terraform/aws/terraform.tfstate"
  }
}