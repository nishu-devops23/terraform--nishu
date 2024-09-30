resource "aws_instance" "myec2" {
    ami = data.aws_ami.amzlinux2.id
    # instance_type = var.instance_type
    instance_type = var.instance_type_list[1]
    # instance_type = var.instance_type_map["prod"]
    vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.web_sg.id]
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.key_name
    count    = 2
    tags = {
      Name = "countmyec2vm-${count.index}"
    }
  
}