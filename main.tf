module "tunnels" {
  source   = "./modules/tf-module-ec2/"
  for_each = var.tunnels

  ami_id                      = "ami-0ec3d9efceafb89e0" #lookup(each.value, "ami_id", lookup(local.ami_ids, var.region))
  region                      = var.region
  ec2_name                    = format("%s%s", lookup(each.value, "name", var.tunnel_defaults.name), each.key)
  instance_type               = lookup(each.value, "instance_type", var.tunnel_defaults.instance_type)
  iam_instance_profile        = lookup(each.value, "iam_profile", aws_iam_instance_profile.tunnel.name)
  user_data_base64            = base64encode(local.userdata)
  user_data_replace_on_change = true
  secondary_private_ips       = lookup(each.value, "secondary_private_ips", var.tunnel_defaults.secondary_private_ips)
  prevent_destroy             = each.value["prevent_destroy"]
  enable_public_ip            = lookup(each.value, "associate_public_ip_address", var.tunnel_defaults.associate_public_ip_address)
  security_group_ids          = [module.security_group.security_group_id]
  subnet_id                   = substr(data.aws_subnet.subnets[data.aws_subnets.selected.ids[0]].availability_zone, -1, 1) == lookup(each.value, "az", var.tunnel_defaults.az) ? data.aws_subnets.selected.ids[0] : data.aws_subnets.selected.ids[1]
  az                          = lookup(each.value, "az", var.tunnel_defaults.az)

  root_block_device = lookup(each.value, "root_block_device", var.tunnel_defaults.root_block_device)
  #ebs_block_devices = lookup(each.value, "ebs_block_devices", {})
  ebs_default_settings = merge(var.tunnel_defaults.ebs_block_devices,
  { "kms_key_id" = try(each.value.kms_key_id, module.tunnel_kms.key.arn) })

  monitoring              = false
  ebs_optimized           = false
  disable_api_termination = false
  tags                    = merge(module.tagging_conventions.tags, {}) #lookup(each.value, "tags", var.tunnel_defaults.tags))
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  vpc_id = data.aws_subnet.subnets[data.aws_subnets.selected.ids[0]].vpc_id

  name                     = var.security_group.name
  description              = var.security_group.description
  ingress_with_cidr_blocks = var.security_group.ingress_with_cidr_blocks
  egress_rules             = var.security_group.egress_rules
  #tags                     = module.tagging_conventions.tags
}

