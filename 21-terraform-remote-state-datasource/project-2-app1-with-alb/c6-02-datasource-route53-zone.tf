
data "aws_route53_zone" "mydomain" {
    provider = aws.route53
    name = "true-fan.in"
}
data "aws_acm_certificate" "acm" {
    domain = "true-fan.in"
    statuses = ["ISSUED"]
  
}
output "mydomain_zoneid" {
  description = "The Hosted Zone ID of the desired Hosted Zone"
  value       = data.aws_route53_zone.mydomain.zone_id
}

output "acm_certificate_arn" {
    description = "this is arn for certificate"
    value = data.aws_acm_certificate.acm.arn
  
}
