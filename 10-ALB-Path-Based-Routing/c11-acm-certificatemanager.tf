# module "acm" {
#   source  = "terraform-aws-modules/acm/aws"
#   version = "5.1.0"

#   domain_name  = trimsuffix(data.aws_route53_zone.mydomain.name, ".")
#   zone_id      = data.aws_route53_zone.mydomain.zone_id

#   validation_method = "DNS"

#   subject_alternative_names = [
#     "*.bollywoodbuzz.club"
#   ]

#   wait_for_validation = true
#   create_route53_records = false
#   validation_record_fqdns = module.route53_records.validation_route53_record_fqdns

#   tags = local.common_tags
# }
# module "route53_records" {
#   source  = "terraform-aws-modules/acm/aws"
#   version = "~> 4.0"

#   providers = {
#     aws = aws.route53
#   }

#   create_certificate          = false
#   create_route53_records_only = true

#   validation_method = "DNS"

#   distinct_domain_names = module.acm.distinct_domain_names
#   zone_id               = data.aws_route53_zone.mydomain.zone_id

#   acm_certificate_domain_validation_options = module.acm.acm_certificate_domain_validation_options
# }

# output "acm_certificate_arn" {
#   description = "The ARN of the certificate"
#   value       = module.acm.acm_certificate_arn
# }
