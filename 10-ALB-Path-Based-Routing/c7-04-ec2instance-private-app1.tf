module "ec2_private_app1" {

 depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.0"
  name = "${var.environment}-private-app1"
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.key_name
  
#   monitoring    = true
#   subnet_id     = module.vpc.private_subnets[0]
  vpc_security_group_ids = [module.private_sg.security_group_id]
#   subnet_ids    = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
#   count = var.private_instance_count
  for_each = toset(["0", "1"])
  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))
  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags
}