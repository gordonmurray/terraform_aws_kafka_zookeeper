resource "aws_key_pair" "pem-key" {
  key_name   = "terraform-aws-kafka"
  public_key = file("~/.ssh/id_rsa.pub")
}
