resource "aws_instance" "myec2" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.web_sg.id]
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.key_name
    tags = {
      Name = "myec2vm"
    }
  
}