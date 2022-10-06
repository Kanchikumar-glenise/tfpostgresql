# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

# We override the terraform block source attribute here just for the environment to show how you would deploy a
# different version of the module in a specific environment.
locals {
  ENVIRONMENT = get_env("TF_VAR_ENVIRONMENT", "bt3_prime_staging")
}

terraform {
  source = "..//components-collection"
  extra_arguments "custom_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh",
      "destroy"
    ]

  }
}

generate "provider" {
  path      = "${get_terragrunt_dir()}/provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region     = var.AWS_DEFAULT_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}
EOF
}

# ---------------------------------------------------------------------------------------------------------------------
# Include configurations that are common used across multiple environments.
# ---------------------------------------------------------------------------------------------------------------------

# Include the root `terragrunt.hcl` configuration. The root configuration contains settings that are common across all
# components and environments, such as how to configure remote state.
include "root" {
  path = find_in_parent_folders()
}

inputs =  {

  auth_database_name = "dabserviceauthdb"
  mcp_database_name = "dabservicemcpdb"
  provisioning_database_name = "dabserviceprovisioningdb"
  transaction_database_name = "dabservicetransactiondb"
  evcharging_database_name = "dabserviceevchargingdb"
  uam_database_name = "dabserviceuamdb"
  kong_database_name = "kongdb"

}