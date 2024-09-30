data "aws_availability_zones" "myazs" {
  filter {
    name = "opt-in-status"
    values = ["opt-in-not-required"]
  }
  
}
resource "aws_instance" "myec2" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    # instance_type = var.instance_type_list[1]
    # instance_type = var.instance_type_map["prod"]
    vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.web_sg.id]
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.key_name
    for_each = toset(data.aws_availability_zones.myazs.names)
    availability_zone = each.key
    tags = {
      Name = "for_eachmyec2vm-${each.value}"
    }
  
}