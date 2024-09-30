variable "aws_region" {
  description = "this is region in which the infra will launch"
  type = string
  default = "ap-south-1"
}

variable "environment" {
    description = "this the enviornment in which the vpc willl be created"
    type = string
    default = "dev"
  
}
variable "business_division" {
    description = "which business division is using"
    type = string
    default = "HR"
  
}
