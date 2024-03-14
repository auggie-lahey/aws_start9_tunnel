data "aws_ami" "this" {
  include_deprecated = var.include_deprecated
  owners = [
    "self",
    "amazon",
  ]
  filter {
    name   = "image-id"
    values = [var.ami_id]
  }
}
data "aws_subnet" "selected" {
  id = var.subnet_id
}

data "aws_caller_identity" "current" {}