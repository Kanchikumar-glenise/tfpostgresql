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