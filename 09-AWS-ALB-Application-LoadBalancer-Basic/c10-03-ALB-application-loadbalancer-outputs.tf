output "id" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.my_alb.id
}

output "arn" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.my_alb.arn
}

output "arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch"
  value       = module.my_alb.arn_suffix
}

output "dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.my_alb.dns_name
}

output "zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records"
  value       = module.my_alb.zone_id
}

################################################################################
# Listener(s)
################################################################################

output "listeners" {
  description = "Map of listeners created and their attributes"
  value       = module.my_alb.listeners
  sensitive   = true
}

output "listener_rules" {
  description = "Map of listeners rules created and their attributes"
  value       = module.my_alb.listener_rules
  sensitive   = true
}

################################################################################
# Target Group(s)
################################################################################

output "target_groups" {
  description = "Map of target groups created and their attributes"
  value       = module.my_alb.target_groups
}
