output "public_ip_list" {
  description = "public ip from list"
  value       = [for instance in aws_instance.myec2: instance.public_ip]
  
}
output "public_ip_map" {
  description = "public ip in map"
  value       = {for instance in aws_instance.myec2: instance.id => instance.public_ip}
  
}
output "public_ip_map2" {
  description = "map with list"
  value       = {for c, instance in aws_instance.myec2: c => instance.public_ip}
  
}
output "splat_type" {
  description = "for splat opeartor"
  value       = aws_instance.myec2[*].public_ip
  
}
# output "public_ip" {
#   description = "public-ip"
#   value = aws_instance.myec2.public_ip
# }
# output "public_dns" {
#   description = "public-dns"
#   value = aws_instance.myec2.public_dns
# }