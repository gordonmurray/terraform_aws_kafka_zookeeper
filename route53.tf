resource "aws_route53_zone" "domain" {
  name    = var.domain_name
  comment = "staging"


}

# Zookeeper DNS records

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

# Kafka DNS records

resource "aws_route53_record" "kafka_1" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = "kafka1.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.kafka.0.public_ip]
}

resource "aws_route53_record" "kafka_2" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = "kafka2.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.kafka.1.public_ip]
}

resource "aws_route53_record" "kafka_3" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = "kafka3.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [aws_instance.kafka.2.public_ip]
}