# AWS RDS Terraform module

Terraform module which creates RDS resources on AWS.

Root module calls these modules which can also be used separately to create independent resources:

- [db_instance] - creates RDS DB instance
- [db_subnet_group] - creates RDS DB subnet group
- [db_parameter_group] - creates RDS DB parameter group
- [db_option_group] - creates RDS DB option group

## Usage

```hcl
module "db" {
  source  = "components/services/rds"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7.25"
  instance_class    = "db.t3a.large"
  allocated_storage = 5

  db_name  = "demodb"
  username = "user"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["sg-12345678"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval = "30"
  monitoring_role_name = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = ["subnet-12345678", "subnet-87654321"]

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  deletion_protection = true

  parameters = [
    {
      name = "character_set_client"
      value = "utf8mb4"
    },
    {
      name = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}
```

## Conditional creation

The following values are provided to toggle on/off creation of the associated resources as desired:

```hcl
module "db" {
  source = "terraform-aws-modules/rds/aws"

  # Disable creation of RDS instance(s)
  create_db_instance = false

  # Disable creation of option group - provide an option group or default AWS default
  create_db_option_group = false

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = false

  # Enable creation of subnet group (disabled by default)
  create_db_subnet_group = true

  # Enable creation of monitoring IAM role
  create_monitoring_role = true

  # ... omitted
}
```

## Option Groups

[Reference](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithOptionGroups.html)

Users have the ability to:

- Create an option group with the name provided:

```hcl
  option_group_name            = "prod-instance-mysql-8.0"
  option_group_use_name_prefix = false
```

- Create an option group using a unique prefix beginning with the name provided:

```hcl
  option_group_name = "prod-instance-mysql-8.0"
```

- Pass the name of an option group to use that has been created outside of the module:

```hcl
  create_db_option_group = false
  option_group_name      = "prod-instance-mysql-8.0" # must already exist in AWS
```

- Skip creating an option group for PostgreSQL entirely as that is not supported

```hcl
  engine            = "postgres"
  option_group_name = "prod-instance-postgresql-11.0" # this will be ignored, no option group created
```

- Use a default option group provided by AWS

```hcl
  create_db_option_group = false
```

## Parameter Groups

[Reference](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithParamGroups.html)

Users have the ability to:

- Create a parameter group with the name provided:

```hcl
  parameter_group_name            = "prod-instance-mysql-8.0"
  parameter_group_use_name_prefix = false
```

- Create a parameter group using a unique prefix beginning with the name provided:

```hcl
  parameter_group_name = "prod-instance-mysql-8.0"
```

- Pass the name of a parameter group to use that has been created outside of the module:

```hcl
  create_db_parameter_group = false
  parameter_group_name   = "prod-instance-mysql-8.0" # must already exist in AWS
```

- Use a default parameter group provided by AWS

```hcl
  create_db_parameter_group = false
```