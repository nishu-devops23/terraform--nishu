resource "aws_eip" "bastion_ip" {
    depends_on = [ 
        module.ec2_public,
        module.vpc
     ]
    instance = module.ec2_public.id
    domain = "vpc"
    # vpc      = true
    tags = local.common_tags
    
}