module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.2.0"

  name = "private-sg"
  description = "security group used for private instance"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id 

  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [data.terraform_remote_state.vpc.outputs.vpc_cidr_block]

  egress_rules = [ "all-all" ]
  tags = local.common_tags
}