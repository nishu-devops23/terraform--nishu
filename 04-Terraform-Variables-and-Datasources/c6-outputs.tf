output "public_ip" {
  description = "public-ip"
  value = aws_instance.myec2.public_ip
}
output "public_dns" {
  description = "public-dns"
  value = aws_instance.myec2.public_dns
}