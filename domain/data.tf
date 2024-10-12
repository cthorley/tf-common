data "aws_route53_zone" "apex" {
  name = var.apex_domain_name
}
