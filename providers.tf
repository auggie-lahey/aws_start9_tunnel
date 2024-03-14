module "tagging_conventions" {
  source = "./modules/tf-module-tagging/"

  account     = var.tags.account
  costcenter = 0
  application = "tunnel"
  product     = "homelab"
  tf_repo     = "aws_start9_tunnel"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = module.tagging_conventions.tags
  }
}