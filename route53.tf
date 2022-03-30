resource "aws_route53_zone" "domain" {
  name    = var.domain_name
  comment = "staging"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "zookeeper_1" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = "zookeeper1.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.zookeeper.0.public_ip]
}

resource "aws_route53_record" "zookeeper_2" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = "zookeeper2.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.zookeeper.1.public_ip]
}

resource "aws_route53_record" "zookeeper_3" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = "zookeeper3.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.zookeeper.2.public_ip]
}
