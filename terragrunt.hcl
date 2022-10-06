# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

locals {
  # Automatically load region-level variables
  ENVIRONMENT         = get_env("TF_VAR_ENVIRONMENT", "bt3_prime_staging")
  AWS_DEFAULT_REGION  = get_env("AWS_DEFAULT_REGION", ("eu-west-2"))
  env_vars = read_terragrunt_config("${get_parent_terragrunt_dir()}/variables/${get_env("TF_VAR_ENVIRONMENT","bt3_prime_staging")}.hcl")
}



# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "bt3-prime-staging-rds-state"
    key            = "${local.ENVIRONMENT}/${path_relative_to_include()}/terraform.tfstate"
    dynamodb_table = "bt3primestaging-rds-state"
    region         = "${local.AWS_DEFAULT_REGION}"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.

inputs = merge(
  local.env_vars.locals
)