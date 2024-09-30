variable "instance_type" {
    description = "this is instance type"
    default = "t2.micro"
    type = string
}

variable "key_name" {
  description = "this is key attach with ec2 instance"
  type = string
  default = "k8sprod2023"
}

variable "private_instance_count" {
    description = "number of private instance"
    type = number
    default = 1
  
}