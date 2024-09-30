vpc_name = "myvpc"
vpc_cidr_block = "10.0.0.0/16"
aws_availability_zones = ["ap-south-1a", "ap-south-1b"]
aws_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
aws_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"] 
vpc_enable_nat_gateway = true  
vpc_single_nat_gateway = true