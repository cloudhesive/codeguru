output "instance_id" {
  description = "El ID de la instancia EC2"
  value       = aws_instance.example.id
}

output "public_ip" {
  description = "La dirección IP pública de la instancia EC2"
  value       = aws_instance.example.public_ip
}

output "public_dns" {
  description = "El DNS público de la instancia EC2"
  value       = aws_instance.example.public_dns
}
