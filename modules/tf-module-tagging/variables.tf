variable "application" {
  description = "Name of application, e.g. queue-processor"
  type        = string
}

variable "account" {
  description = "Name of AWS environment/account, e.g. dev"
  type        = string
  # validation {
  #   condition     = contains(["sandbox", "preprod", "test", "uat", "rc", "prod", "shared-services"], lower(format("%v", var.account)))
  #   error_message = "Valid values for environment are sandbox, preprod, test, uat, rc, prod, shared-services"
  # }
}

variable "costcenter" {
  description = "cost center"
  type        = number
  # validation {
  #   condition     = contains(["0",], lower(format("%v", var.costcenter)))
  #   error_message = "invalid cost center"
  # }
}

# variable "map_migrated" {
#   description = "Name of map-migrated tag, required for AWS Migration Acceleration Program tracking"
#   type        = string
#   default     = "na"
# }

variable "product" {
  description = "Name of product"
  type        = string
}

variable "team" {
  description = "Name of team that owns a tagged resource, e.g. IAM"
  type        = string
  default     = null
}

variable "tf_repo" {
  description = "Name of the repo where the code can be found"
  type        = string
  default     = null
}

variable "tf_backend" {
  description = "Full path of where the terraform backend can be found. Only use this if its different from the standard"
  type        = string
  default     = null
}
