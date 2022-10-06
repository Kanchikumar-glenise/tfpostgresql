variable "AWS_DEFAULT_REGION" {
  default = "eu-west-2"
}

variable "AWS_ACCESS_KEY_ID" {
  default = ""
  type    = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  default = ""
  type    = string
}

variable "ENVIRONMENT" {
  default = ""
  type    = string
}