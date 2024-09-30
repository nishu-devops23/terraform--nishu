output "vpc_id" {
  description = "The ID of the VPC"
  value = module.vpc.vpc_id
}
output "vpc_cidr_block" {
  description = "this cidr for vpc"
  value = module.vpc.vpc_cidr_block
}
output "private_subnets" {
  description = "this is private subnet"
  value = module.vpc.private_subnets
}
output "public_subnets" {
  description = "this is private subnet"
  value = module.vpc.public_subnets
}
output "nat_public_ips" {
  description = "this is for public ips"
  value = module.vpc.nat_public_ips
}
output "azs" {
  description = "availability zones"
  value = module.vpc.azs
}