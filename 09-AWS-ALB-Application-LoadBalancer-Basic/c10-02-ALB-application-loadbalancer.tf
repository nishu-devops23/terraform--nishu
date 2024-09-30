module "my_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.4.0"

  name    = "${local.name}-alb"
  load_balancer_type = "application"
  vpc_id  = module.vpc.vpc_id
  subnets = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups = [module.lb_sg.security_group_id]
  tags = local.common_tags

listeners = {
    my-http-listner = {
      port     = 80
      protocol = "HTTP"
      forward = {
        target_group_key = "mytg1"
      }
    }
}

target_groups = {
    mytg1 = {
      create_attachment                 = false
      name_prefix                       = "mytg1-"
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      protocol_version = "HTTP1"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      tags = local.common_tags
    }
 }
} 
resource "aws_lb_target_group_attachment" "mytg1" {
    for_each         = {for k, v in module.ec2_private: k => v}
    target_group_arn = module.my_alb.target_groups["mytg1"].arn
    target_id        = each.value.id
    port             = 80
  
}