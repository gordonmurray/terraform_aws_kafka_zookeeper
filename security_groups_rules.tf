resource "aws_security_group_rule" "kafka_egress_1" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.kafka.id
  description       = "Allow all out"
}

resource "aws_security_group_rule" "kafka_ingress_1" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.kafka.id
  description       = "Self"
}

resource "aws_security_group_rule" "kafka_ingress_2" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.my_ip_address}/32"]
  security_group_id = aws_security_group.kafka.id
  description       = "SSH"
}

resource "aws_security_group_rule" "zookeeper_egress_1" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.zookeeper.id
  description       = "Allow all out"
}

resource "aws_security_group_rule" "zookeeper_ingress_1" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.zookeeper.id
  description       = "Self"
}

resource "aws_security_group_rule" "zookeeper_ingress_2" {
  type                     = "ingress"
  from_port                = 2181
  to_port                  = 2181
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.kafka.id
  security_group_id        = aws_security_group.zookeeper.id
  description              = "Self"
}

resource "aws_security_group_rule" "zookeeper_ingress_3" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.my_ip_address}/32"]
  security_group_id = aws_security_group.zookeeper.id
  description       = "SSH"
}
