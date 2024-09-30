variable "instance_type" {
    description = "this is instance type"
    default = "t2.micro"
    type = string
}

variable "aws_region" {
  description = "this is region in which the infra will launch"
  type = string
  default = "ap-south-1"
}

variable "key_name" {
  description = "this is key attach with ec2 instance"
  type = string
  default = "k8sprod2023"
}
# variable "instance_type_list" {
#   description = "more than one instance type in list"
#   type        = list(string)
#   default     = [ "t2.micro", "t2.small", "t3a.medium" ]
# }
# variable "instance_type_map" {
#   description = "more than one instance in map"
#   type        = map(string)
#   default  = {
#     "dev"  = "t2.micro"
#     "qa"   = "t2.small"
#     "prod" = "t3a.medium"
#   }
# }