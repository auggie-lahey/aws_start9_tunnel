resource "aws_route53_record" "service_A_record" {
  for_each = local.services
  zone_id  = data.aws_route53_zone.selected.zone_id
  name     = "${each.value.subdomain}.${local.domain}"
  type     = "A"
  ttl      = 300
  records  = [module.tunnels["0"].ec2.public_ip]
}