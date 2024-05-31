resource "aws_route53_zone" "test_zone" {
  name = "hostoo.online"  # Specify the domain name for your hosted zone
}

resource "aws_route53_record" "test_cname_record" {
  zone_id = aws_route53_zone.test_zone.zone_id  # Reference the hosted zone
  name    = "test.hostoo.online"  # Specify the subdomain for the CNAME record
  type    = "CNAME"  # Specify the record type
  ttl     = 300  # Time to live in seconds
  records = [aws_lb.test_lb.dns_name]  # Use the load balancer's DNS name
}

resource "aws_route53_record" "dev_record" {
  zone_id = aws_route53_zone.test_zone.zone_id  # Reference the hosted zone
  name    = "dev.hostoo.online"  # Specify the subdomain for the A record
  type    = "A"  # Specify the record type (A record)
  ttl     = 300  # Time to live in seconds

  records = [aws_instance.dev.public_ip]  # Specify the IP address associated with the record
}


resource "aws_route53_record" "stage_record" {
  zone_id = aws_route53_zone.test_zone.zone_id  # Reference the hosted zone
  name    = "stage.hostoo.online"  # Specify the subdomain for the A record
  type    = "A"  # Specify the record type (A record)
  ttl     = 300  # Time to live in seconds

  records = [aws_instance.stage.public_ip]  # Specify the IP address associated with the record
}
