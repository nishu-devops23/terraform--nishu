resource "aws_instance" "myec2" {
    ami = "ami-08718895af4dfa033"
    instance_type = "t2.micro"
    user_data = file("${path.module}/app1-install.sh")
    tags = {
      Name = "myec2vm"
    }
  
}