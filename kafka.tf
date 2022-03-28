# Get the kafka AMI created by Packer
data "aws_ami" "kafka" {
  most_recent = true

  filter {
    name   = "name"
    values = ["kafka"]
  }
}

# Prepare user_data via a template file
data "template_file" "user_data" {
  template = file("files/kafka.tpl")
  vars = {
    zookeeper_address = ""
  }
}

# Create EC2 instance
resource "aws_instance" "kafka" {
  ami                     = data.aws_ami.kafka.id
  key_name                = aws_key_pair.pem-key.key_name
  subnet_id               = aws_subnet.subnet-1a.id
  vpc_security_group_ids  = [aws_security_group.example.id]
  disable_api_termination = true

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = "50"

    tags = {
      Name = "terraform_aws_kafka"
    }
  }

  tags = {
    Name = "terraform_aws_kafka"
  }

  user_data = data.template_file.user_data.rendered

}
