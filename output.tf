output "load_balancer_url" {
  value = aws_lb.test_lb.dns_name
}

output "Stage_server_IP" {
  value = aws_instance.stage.public_ip
}

output "Dev_server_IP" {
  value = aws_instance.dev.public_ip
}

