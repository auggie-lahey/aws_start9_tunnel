locals {
  availability_zone_abbreviation = {
    "a" = "a"
    "b" = "b"
    "c" = "c"
  }
  region_abbreviation = {
    "us-west-1" = "usw1"
    "us-east-1" = "use1"
  }

  bdm = {
    for device in data.aws_ami.this.block_device_mappings :
    device.device_name => device.ebs
    if device.device_name != "/dev/sda1" && device.device_name != "/dev/xvda" && !startswith(device.virtual_name, "ephemeral")
  }
  inputOnly = setsubtract(keys(var.ebs_block_devices), keys(local.bdm))
  inputOnlym = {
    for device in local.inputOnly :
    device => var.ebs_block_devices[device]
  }
  amiOnly = setsubtract(keys(local.bdm), keys(var.ebs_block_devices))
  amiOnlym = {
    for device in local.amiOnly :
    device => local.bdm[device]
  }
  both = setintersection(keys(local.bdm), keys(var.ebs_block_devices))
  bothm = {
    for device in local.both :
    device => merge(local.bdm[device], var.ebs_block_devices[device])
    if lookup(var.ebs_block_devices[device], "deleted", false) == null ? true : false
  }
  m = local.inputOnly == local.both ? tomap({}) : merge(local.inputOnlym, local.amiOnlym, local.bothm)
  tags = merge(
    {
      "Name" = var.ec2_name
    },
    var.tags
  )
}