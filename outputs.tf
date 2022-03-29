output "zookeeper_ip_addresses" {
  value = formatlist("%v", aws_instance.zookeeper.*.public_ip)
}

output "kafka_ip_addresses" {
  value = formatlist("%v", aws_instance.kafka.*.public_ip)
}

output "zookeeper_primary" {
  value = aws_instance.zookeeper.0.public_ip
}
