output "ec2_instance_public_id" {
    description = "id of bastion host"
    value       = module.ec2_public.id
  
}
output "ec2_public_ip" {
    description = "public ip of bastion host"
    value       = module.ec2_public.public_ip
  
}

output "ec2_private_instance_id" {
    description = "id of private instance"
    value       =  [for ec2 in module.ec2_private: ec2.id]    
    # value       = module.ec2_private.id
  
}
output "ec2_private_ip" {
    description = "private ip of instances"
    value       = [for ec2 in module.ec2_private: ec2.private_ip]
    # value       = module.ec2_private.private_ip
  
}