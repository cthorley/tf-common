output "acm_certificate_domain" {
  value = aws_acm_certificate.identity.domain_name
}

output "name" {
  value = local.identity_domain_name
}

output "zone_id" {
  value = local.identity_zone_id
}
