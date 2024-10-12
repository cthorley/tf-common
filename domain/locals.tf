locals {
  subdomain = var.subdomain == null ? var.environment : var.subdomain

  delegation_domain_name = "${local.subdomain}.${var.apex_domain_name}"

  identity_domain_name = var.is_apex ? var.apex_domain_name : local.delegation_domain_name
  
  identity_zone_id = var.is_apex ? data.aws_route53_zone.apex.zone_id : aws_route53_zone.delegation.zone_id
}
