output "master_public_ip" {
  description = "Public IP of the Master node"
  value       = aws_instance.master.public_ip
}

output "worker_public_ip" {
  description = "Public IP of the Worker node"
  value       = aws_instance.worker.public_ip
}

output "ssh_command" {
  description = "Command to connect to the Master node"
  value       = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.master.public_ip}"
}
