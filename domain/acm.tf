resource "aws_acm_certificate" "identity" {
  domain_name               = local.identity_domain_name
  subject_alternative_names = ["*.${local.identity_domain_name}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route53_record" "acm_validation" {
  for_each = {
    for dvo in aws_acm_certificate.identity.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = local.identity_zone_id
}


resource "aws_acm_certificate_validation" "identity" {
  certificate_arn         = aws_acm_certificate.identity.arn
  validation_record_fqdns = [for record in aws_route53_record.acm_validation : record.fqdn]
}
