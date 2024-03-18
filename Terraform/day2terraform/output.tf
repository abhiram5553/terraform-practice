output "public" {
  value = aws_instance.abhi.public_ip
}
output "private" {
    value = aws_instance.abhi.private_ip
  
}