module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.13.0"


    name = "vpc-dev"
    cidr = "10.0.0.0/16"
    azs             = ["ap-south-1a", "ap-south-1b"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]



    enable_nat_gateway = true
    single_nat_gateway = true

    enable_dns_hostnames = true
    enable_dns_support = true

    public_subnet_tags = {
        Name = "public-subnet"
    }
    private_subnet_tags = {
        Name = "private-subnet"
    }

    tags = {
        owners      = "Nishu"
        environment = "dev"
    }

    vpc_tags = {
        Name = "vpc-dev"
    }
}
