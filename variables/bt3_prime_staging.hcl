locals {
  vpc_id = "vpc-0f62b3731aca37d72"
  #subnets = ["10.1.12.0/22", "10.1.76.0/22", "10.1.140.0/22"]
  subnets = ["subnet-0bac1f509d90a9ed8", "subnet-07454ce6a18fd72ac", "subnet-0041d5378d576585c"]
  db_subnet_group_name = "bt3_prime_staging"
  allowed_cidr_blocks = ["10.1.76.0/22"]
  vpc_security_group_ids = []

}