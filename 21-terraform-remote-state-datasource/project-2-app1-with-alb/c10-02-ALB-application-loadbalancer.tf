module "my_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.4.0"

  name    = "${local.name}-alb"
  load_balancer_type = "application"
  enable_deletion_protection = false
  vpc_id  = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets = [data.terraform_remote_state.vpc.outputs.public_subnets[0], data.terraform_remote_state.vpc.outputs.public_subnets[1]]
  security_groups = [module.lb_sg.security_group_id]
  tags = local.common_tags

listeners = {
    my-http-https-redirect = {
      port     = 80
      protocol = "HTTP"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }

    my-https-listner = {
      port            = 443
      protocol        = "HTTPS"
      ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
      certificate_arn = data.aws_acm_certificate.acm.arn

      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed Static message - for Root Context"
        status_code  = "200"
      }
      rules = {
        # Rule-1: myapp1-rule
        myapp1-rule = {
          actions = [{
            type = "weighted-forward"
            target_groups = [
              {
                target_group_key = "mytg1"
                weight           = 1
              }
            ]
            stickiness = {
              enabled  = true
              duration = 3600
            }
          }]
          conditions = [{
            path_pattern = {
              values = ["/app1*"]
            }
          }]
        }# End of myapp1-rule
        # Rule-2: myapp2-rule
        myapp2-rule = {
          actions = [{
            type = "weighted-forward"
            target_groups = [
              {
                target_group_key = "mytg2"
                weight           = 1
              }
            ]
            stickiness = {
              enabled  = true
              duration = 3600
            }
          }]
          conditions = [{
            path_pattern = {
              values = ["/app2*"]
            }
          }]
        }# End of myapp2-rule Block
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

    mytg2 = {
      create_attachment                 = false
      name_prefix                       = "mytg2-"
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      protocol_version = "HTTP1"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
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
    for_each         = {for k, v in module.ec2_private_app1: k => v}
    target_group_arn = module.my_alb.target_groups["mytg1"].arn
    target_id        = each.value.id
    port             = 80
  
}
resource "aws_lb_target_group_attachment" "mytg2" {
    for_each         = {for k, v in module.ec2_private_app2: k => v}
    target_group_arn = module.my_alb.target_groups["mytg2"].arn
    target_id        = each.value.id
    port             = 80
  
}
