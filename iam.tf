data "aws_iam_policy_document" "tunnel" {
  statement {
    actions = [
      "ec2:*",
      "tag:GetResources",
    ]
    resources = ["*"]
  }
  statement {
    actions = [
      "kms:ListKeys",
      "kms:ListAliases",
      "kms:Get*",
      "kms:GenerateDataKey*",
      "kms:Encrypt",
      "kms:Describe*",
      "kms:Decrypt",
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "cloudwatch:UntagResource",
      "cloudwatch:ListTagsForResource",
      "cloudwatch:TagResource",
      "cloudwatch:PutDashboard",
      "cloudwatch:ListDashboards",
      "cloudwatch:DeleteDashboards",
      "cloudwatch:GetDashboard",
      "cloudwatch:ListMetrics",
      "cloudwatch:PutMetricData",
      "cloudwatch:GetMetricData",
      "cloudwatch:DeleteInsightRules",
      "cloudwatch:DeleteAnomalyDetector",
      "cloudwatch:StartMetricStreams",
      "cloudwatch:DescribeAnomalyDetectors",
      "cloudwatch:StopMetricStreams",
      "cloudwatch:DeleteMetricStream",
      "cloudwatch:PutAnomalyDetector",
      "cloudwatch:GetMetricWidgetImage",
      "cloudwatch:DescribeInsightRules",
      "cloudwatch:GetInsightRuleReport",
      "cloudwatch:DisableInsightRules",
      "cloudwatch:EnableInsightRules",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:PutMetricStream",
      "cloudwatch:PutInsightRule",
      "cloudwatch:ListMetricStreams",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:GetMetricStream"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "ssm:*"
    ]
    resources = ["*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "route53:ListHostedZones",
      "route53:GetChange",
      "route53:ChangeResourceRecordSets"
    ]
    resources = ["*"]
  }
}

module "tunnel_role" {
  source = "./modules/tf-module-iam-role/"

  role_name = "tunnel"
  policy    = data.aws_iam_policy_document.tunnel.json
  trusted_identifier = {
    type        = "Service"
    identifiers = ["ec2.amazonaws.com"]
  }
}

resource "aws_iam_instance_profile" "tunnel" {
  name = "tunnel"
  role = module.tunnel_role.role.name
}