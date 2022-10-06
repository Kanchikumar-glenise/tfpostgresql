################################################################################
# Auth RDS Aurora DB
################################################################################
module "dabserviceauthdb" {
  source = "..//components/rds"

  # Enable/Disable creation of RDS instance(s)
  create_db_instance = true

  identifier  = var.auth_database_name
  environment = var.environment

  engine         = "postgres"
  engine_version = "14.3"
  instance_class = "db.t3.medium"

  allocated_storage = 100

  db_name                = var.auth_database_name
  username               = "master"
  port                   = "5432"
  create_random_password = true

  iam_database_authentication_enabled = true

  multi_az = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 7

  skip_final_snapshot = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false
  option_group_name      = ""
  # DB option group
  major_engine_version = "5.7"

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = true
  parameter_group_name      = "${var.auth_database_name}-postgres-parameter-group"
  # DB parameter group
  family = "postgres14.3"

  # Enable creation of subnet group (disabled by default)
  create_db_subnet_group = true
  db_subnet_group_name   = var.db_subnet_group_name
  subnet_ids             = var.subnets

  # Enable creation of monitoring IAM role
  create_monitoring_role = true
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"

  # Database Deletion Protection
  deletion_protection = true

}


################################################################################
# MCP RDS Aurora DB
################################################################################
module "dabservicemcpdb" {
  source = "..//components/rds"

  # Enable/Disable creation of RDS instance(s)
  create_db_instance = true

  identifier  = var.mcp_database_name
  environment = var.environment

  engine         = "postgres"
  engine_version = "14.3"
  instance_class = "db.t3.medium"

  allocated_storage = 100

  db_name                = var.mcp_database_name
  username               = "master"
  port                   = "5432"
  create_random_password = true

  iam_database_authentication_enabled = true

  multi_az = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 7

  skip_final_snapshot = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false
  option_group_name      = ""
  # DB option group
  major_engine_version = "5.7"

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = true
  parameter_group_name      = "${var.mcp_database_name}-postgres-parameter-group"
  # DB parameter group
  family = "postgres14.3"

  # Enable creation of subnet group (disabled by default)
  create_db_subnet_group = false
  db_subnet_group_name   = var.db_subnet_group_name
  subnet_ids             = var.subnets

  # Enable creation of monitoring IAM role
  create_monitoring_role = false
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"

  # Database Deletion Protection
  deletion_protection = true

}

################################################################################
# Provisioning RDS Aurora DB
################################################################################
module "dabserviceprovisioningdb" {
  source = "..//components/rds"

  # Enable/Disable creation of RDS instance(s)
  create_db_instance = true

  identifier  = var.provisioning_database_name
  environment = var.environment

  engine         = "postgres"
  engine_version = "14.3"
  instance_class = "db.t3.medium"

  allocated_storage = 100

  db_name                = var.provisioning_database_name
  username               = "master"
  port                   = "5432"
  create_random_password = true

  iam_database_authentication_enabled = true

  multi_az = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 7

  skip_final_snapshot = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false
  option_group_name      = ""
  # DB option group
  major_engine_version = "5.7"

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = true
  parameter_group_name      = "${var.provisioning_database_name}-postgres-parameter-group"
  # DB parameter group
  family = "postgres14.3"

  # Enable creation of subnet group (disabled by default)
  create_db_subnet_group = false
  db_subnet_group_name   = var.db_subnet_group_name
  subnet_ids             = var.subnets

  # Enable creation of monitoring IAM role
  create_monitoring_role = false
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"

  # Database Deletion Protection
  deletion_protection = true

}

################################################################################
# Transaction RDS Aurora DB
################################################################################
module "dabservicetransactiondb" {
  source = "..//components/rds"

  # Enable/Disable creation of RDS instance(s)
  create_db_instance = true

  identifier  = var.transaction_database_name
  environment = var.environment

  engine         = "postgres"
  engine_version = "14.3"
  instance_class = "db.t3.medium"

  allocated_storage = 100

  db_name                = var.transaction_database_name
  username               = "master"
  port                   = "5432"
  create_random_password = true

  iam_database_authentication_enabled = true

  multi_az = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 7

  skip_final_snapshot = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false
  option_group_name      = ""
  # DB option group
  major_engine_version = "5.7"

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = true
  parameter_group_name      = "${var.transaction_database_name}-postgres-parameter-group"
  # DB parameter group
  family = "postgres14.3"

  # Enable creation of subnet group (disabled by default)
  create_db_subnet_group = false
  db_subnet_group_name   = var.db_subnet_group_name
  subnet_ids             = var.subnets

  # Enable creation of monitoring IAM role
  create_monitoring_role = false
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"

  # Database Deletion Protection
  deletion_protection = true

}

################################################################################
# EVCharging RDS Aurora DB
################################################################################
module "dabserviceevchargingdb" {
  source = "..//components/rds"

  # Enable/Disable creation of RDS instance(s)
  create_db_instance = true

  identifier  = var.evcharging_database_name
  environment = var.environment

  engine         = "postgres"
  engine_version = "14.3"
  instance_class = "db.t3.medium"

  allocated_storage = 100

  db_name                = var.evcharging_database_name
  username               = "master"
  port                   = "5432"
  create_random_password = true

  iam_database_authentication_enabled = true

  multi_az = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 7

  skip_final_snapshot = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false
  option_group_name      = ""
  # DB option group
  major_engine_version = "5.7"

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = true
  parameter_group_name      = "${var.evcharging_database_name}-postgres-parameter-group"
  # DB parameter group
  family = "postgres14.3"

  # Enable creation of subnet group (disabled by default)
  create_db_subnet_group = false
  db_subnet_group_name   = var.db_subnet_group_name
  subnet_ids             = var.subnets

  # Enable creation of monitoring IAM role
  create_monitoring_role = false
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"

  # Database Deletion Protection
  deletion_protection = true

}

################################################################################
# UAM RDS Aurora DB
################################################################################
module "dabserviceuamdb" {
  source = "..//components/rds"

  # Enable/Disable creation of RDS instance(s)
  create_db_instance = true

  identifier  = var.uam_database_name
  environment = var.environment

  engine         = "postgres"
  engine_version = "14.3"
  instance_class = "db.t3.medium"

  allocated_storage = 100

  db_name                = var.uam_database_name
  username               = "master"
  port                   = "5432"
  create_random_password = true

  iam_database_authentication_enabled = true

  multi_az = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 7

  skip_final_snapshot = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false
  option_group_name      = ""
  # DB option group
  major_engine_version = "5.7"

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = true
  parameter_group_name      = "${var.uam_database_name}-postgres-parameter-group"
  # DB parameter group
  family = "postgres14.3"

  # Enable creation of subnet group (disabled by default)
  create_db_subnet_group = false
  db_subnet_group_name   = var.db_subnet_group_name
  subnet_ids             = var.subnets

  # Enable creation of monitoring IAM role
  create_monitoring_role = false
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"

  # Database Deletion Protection
  deletion_protection = true

}

################################################################################
# KONG RDS Aurora DB
################################################################################
module "kongdb" {
  source = "..//components/rds"

  # Enable/Disable creation of RDS instance(s)
  create_db_instance = true

  identifier  = var.kong_database_name
  environment = var.environment

  engine         = "postgres"
  engine_version = "14.3"
  instance_class = "db.t3.medium"

  allocated_storage = 100

  db_name                = var.kong_database_name
  username               = "master"
  port                   = "5432"
  create_random_password = true

  iam_database_authentication_enabled = true

  multi_az = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  backup_retention_period = 7

  skip_final_snapshot = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false
  option_group_name      = ""
  # DB option group
  major_engine_version = "5.7"

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = true
  parameter_group_name      = "${var.kong_database_name}-postgres-parameter-group"
  # DB parameter group
  family = "postgres14"

  # Enable creation of subnet group (disabled by default)
  create_db_subnet_group = true
  db_subnet_group_name   = var.db_subnet_group_name
  subnet_ids             = var.subnets

  # Enable creation of monitoring IAM role
  create_monitoring_role = true
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"

  # Database Deletion Protection
  deletion_protection = true

}

##########################################################################################
# Variables
##########################################################################################
variable "auth_database_name" {
  description = "List of database_names"
  default     = ""
  type        = string
}

variable "mcp_database_name" {
  description = "List of database_names"
  default     = ""
  type        = string
}

variable "provisioning_database_name" {
  description = "List of database_names"
  default     = ""
  type        = string
}

variable "transaction_database_name" {
  description = "List of database_names"
  default     = ""
  type        = string
}

variable "evcharging_database_name" {
  description = "List of database_names"
  default     = ""
  type        = string
}

variable "uam_database_name" {
  description = "List of database_names"
  default     = ""
  type        = string
}

variable "kong_database_name" {
  description = "list of database_names"
  default     = ""
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = ""
}

variable "db_subnet_group_name" {
  type = string
}

variable "allowed_cidr_blocks" {
  type = list(string)
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "subnets" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
}

variable "environment" {
  default = ""
  type    = string
}

