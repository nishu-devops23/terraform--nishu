data "aws_availability_zones" "myazs" {
  filter {
    name = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "my_int_type" {
  for_each = toset(data.aws_availability_zones.myazs.names)
  filter {
    name = "instance-type"
    values = [ "t2.micro" ]
  }
  filter {
    name = "location"
    values = [ each.key ]
  }
  location_type = "availability-zone"
}


output "azsinttype_1" {

    value = {for az, details in data.aws_ec2_instance_type_offerings.my_int_type: az => details.instance_types}
  
}

output "azsinttype_2" {
    value = { for az, details in data.aws_ec2_instance_type_offerings.my_int_type:
             az => details.instance_types if length(details.instance_types) != 0 }
  
}
output "azsinttype_3" {

    value = keys({ for az, details in data.aws_ec2_instance_type_offerings.my_int_type:
             az => details.instance_types if length(details.instance_types) != 0 })
  
}
output "azsinttype_4" {

    value = keys({ for az, details in data.aws_ec2_instance_type_offerings.my_int_type:
             az => details.instance_types if length(details.instance_types) != 0 })[0]
  
}
