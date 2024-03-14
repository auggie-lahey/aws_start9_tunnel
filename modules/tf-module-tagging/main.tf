locals {
  # Common tags to be assigned to all resources
  common_tags = {
    application = lower(format("%v", var.application))
    account     = lower(format("%v", var.account))
    costcenter  = lower(format("%v", var.costcenter))
    #map-migrated         = "na"
    tf_managed = ""
    product    = lower(format("%v", var.product))
  }

  optional_tags = {
    team       = lower(format("%v", var.team))
    tf_backend = lower(format("%v", var.tf_backend))
    tf_repo    = lower(format("%v", var.tf_repo))
  }

  all_tags = merge({
    for key, value in local.optional_tags :
    key => value
    if value != "null"
  }, local.common_tags)
}
