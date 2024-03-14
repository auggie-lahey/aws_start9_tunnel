data "aws_subnets" "selected" {
  filter {
    name   = "tag:Name"
    values = ["third*"]
  }
}

data "aws_route53_zone" "selected" {
  name         = local.domain
  private_zone = false
}


data "aws_subnet" "subnets" {
  for_each = toset(data.aws_subnets.selected.ids)
  id       = each.value
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}