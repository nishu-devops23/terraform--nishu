resource "aws_route53_record" "apps_dns" {
  provider = aws.route53
  zone_id = data.aws_route53_zone.mydomain.zone_id 
  name    = "apps.true-fan.in"
  type    = "A"
  alias {
    #name                   = module.alb.this_lb_dns_name
    #zone_id                = module.alb.this_lb_zone_id
    name                   = module.my_alb.dns_name
    zone_id                = module.my_alb.zone_id
    evaluate_target_health = true
  }  
}