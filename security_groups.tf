
resource "aws_security_group" "zookeeper" {
  name        = "zookeeper"
  description = "zookeeper security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "terraform_aws_kafka"
  }
}

resource "aws_security_group" "kafka" {
  name        = "kafka"
  description = "kafka security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "terraform_aws_kafka"
  }
}

