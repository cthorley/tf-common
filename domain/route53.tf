resource "aws_route53_zone" "delegation" {
  name = local.delegation_domain_name
}

resource "aws_route53_record" "ns" {
  name    = local.delegation_domain_name
  records = aws_route53_zone.delegation.name_servers
  ttl     = 300
  type    = "NS"
  zone_id = data.aws_route53_zone.apex.zone_id
}
