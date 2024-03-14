data "aws_iam_policy_document" "tunnel_kms" {
  statement {
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
    actions = [
      "kms:*"
    ]
    resources = ["*"]
  }
}

module "tunnel_kms" {
  source = "./modules/tf-module-kms/"

  data_classification = "standard"
  application         = "tunnel/kms"
  multi_region        = true
  policy              = data.aws_iam_policy_document.tunnel_kms.json
}