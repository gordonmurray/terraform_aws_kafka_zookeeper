# Get the kafka AMI created by Packer
data "aws_ami" "kafka" {
  most_recent = true

  filter {
    name   = "name"
    values = ["kafka"]
  }

  owners = [var.aws_ami_account_id]
}

# Prepare user_data via a template file
data "template_file" "kafka_user_data" {
  template = file("files/kafka.tpl")
  vars = {
    zookeeper_address = aws_instance.zookeeper.0.public_ip
  }
}

# Get the zookeeper AMI created by Packer
data "aws_ami" "zookeeper" {
  most_recent = true

  filter {
    name   = "name"
    values = ["zookeeper"]
  }

  owners = [var.aws_ami_account_id]

}

# Prepare user_data via a template file
data "template_file" "zookeeper_user_data" {
  template = file("files/zookeeper.tpl")
}


# Create Kafka instance(s)
resource "aws_instance" "kafka" {
  ami                     = data.aws_ami.kafka.id
  key_name                = aws_key_pair.pem-key.key_name
  subnet_id               = var.vpc_subnets[count.index]
  vpc_security_group_ids  = [aws_security_group.kafka.id]
  disable_api_termination = false
  instance_type           = var.instance_type_kafka
  count                   = 3

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = "50"

    tags = {
      Name = "kafka ${count.index}"
    }
  }

  tags = {
    Name = "kafka ${count.index}"
  }

  user_data = data.template_file.kafka_user_data.rendered

}

# Create Zookeeper instance(s)
resource "aws_instance" "zookeeper" {
  ami                     = data.aws_ami.zookeeper.id
  key_name                = aws_key_pair.pem-key.key_name
  subnet_id               = var.vpc_subnets[0]
  vpc_security_group_ids  = [aws_security_group.zookeeper.id]
  disable_api_termination = false
  instance_type           = var.instance_type_zookeeper
  count                   = 3

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = "50"

    tags = {
      Name = "zookeeper ${count.index}"
    }
  }

  tags = {
    Name = "zookeeper ${count.index}"
  }

  user_data = data.template_file.zookeeper_user_data.rendered

}
