# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "bt3-prime-staging-rds-state"
    dynamodb_table = "bt3primestaging-rds-state"
    encrypt        = true
    key            = "bt3_prime_staging/./terraform.tfstate"
    region         = "eu-west-2"
  }
}