module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.13.0"


    name = "${local.name}-${var.vpc_name}"
    cidr            = var.vpc_cidr_block
    azs             = var.aws_availability_zones
    private_subnets = var.aws_private_subnets
    public_subnets  = var.aws_public_subnets



    enable_nat_gateway = var.vpc_enable_nat_gateway
    single_nat_gateway = var.vpc_single_nat_gateway

    enable_dns_hostnames = true
    enable_dns_support = true

    public_subnet_tags = {
        Type = "public-subnet"
    }
    private_subnet_tags = {
        Type = "private-subnet"
    }

    tags     = local.common_tags
    vpc_tags = local.common_tags
}