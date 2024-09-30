module "lb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name = "clb-sg"
  description = "security group used for lb"
  vpc_id = module.vpc.vpc_id

  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = [ "all-all" ]
  tags = local.common_tags
}