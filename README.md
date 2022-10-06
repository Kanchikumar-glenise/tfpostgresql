# export env variables
### env
set TF_VAR_ENVIRONMENT=bt3_prime_staging
set TF_VAR_AWS_ACCESS_KEY_ID="insert your aws_access_key_id here"
set TF_VAR_AWS_SECRET_ACCESS_KEY="insert your aws_secret_access_key here"
set TF_VAR_AWS_DEFAULT_REGION=eu-west-2

#for terragrunt init
terragrunt init

#Commands for Terraform fmt
#to See the difference
terraform fmt -diff

#for subdirectories formatting
terraform fmt -recursive

#disable the list of file changes
terraform fmt -list=false

#for terragrunt plan
terragrunt run-all plan -parallelism=50 -lock=false -parallelism=10 -out=plan

#for terragrunt apply
terragrunt run-all apply --terragrunt-non-interactive -auto-approve -parallelism=50