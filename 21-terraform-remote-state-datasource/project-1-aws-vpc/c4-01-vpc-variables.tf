variable "vpc_name" {
    description = "this the name of vpc"
    type = string
    default = "myvpc"
}
variable "vpc_cidr_block" {
    description = "this the cidr range for the vpc"
    type = string
    default = "10.0.0.0/16"
}
variable "aws_availability_zones" {
    description = "these are azs in which vpc subnets  will be launch"
    type        = list(string)
    default     = [ "ap-south-1a", "ap-south-1b" ]
}
variable "aws_private_subnets" {
    description = "these are private subnets"
    type        = list(string)
    default     = [ "10.0.1.0/24", "10.0.2.0/24" ]
  
}
variable "aws_public_subnets" {
    description = "these are public subnets"
    type        = list(string)
    default     = [ "10.0.101.0/24", "10.0.102.0/24" ]
  
}
variable "vpc_enable_nat_gateway" {
    description = "enable or disable the nat gateway to communicate outbound"
    type        = bool
    default     = true
}
variable "vpc_single_nat_gateway" {
    description = "only one nat gateway attched to private subnets"
    type        = bool
    default     = true
}
