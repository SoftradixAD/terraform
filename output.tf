output "load_balancer_url" {
  value = aws_lb.test_lb.dns_name
}

output "Stage_server_IP" {
  value = aws_instance.stage.public_ip
}

output "Dev_server_IP" {
  value = aws_instance.dev.public_ip
}

output "nameservers" {
  value = aws_route53_zone.test_zone.name_servers
}

output "records" {
  value = aws_route53_zone.test_zone.name
}  

output "stage_record" {
  value = aws_route53_record.stage_record.name
}

output "dev_record" {
  value = aws_route53_record.dev_record.name
}
