variable "mongo_region" {
  description = "Region used for mongo's AWS services"
  default     = "US_WEST_2"
}

variable "mongo_org_id" {
  description = "Organization id from mongo"
  default     = "61527ca063086f463022f613"
}

variable "environment" {
    description = "Whether terraform is creating the dev, test, or prod environment"
}

variable "cli_user_password" {
  description = "Password for logging into mongo cluster via the CLI to perform database setup tasks not supported via terraform"
}