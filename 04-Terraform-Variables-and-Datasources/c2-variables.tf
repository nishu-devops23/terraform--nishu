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