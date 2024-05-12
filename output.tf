output "ec2_ip_publico" {
  value = aws_instance.web[*].public_ip
  description = "Output com os IPS públicos"
}