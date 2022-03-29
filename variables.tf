variable "vpc_id" {
  type        = string
  description = "VPC to use"
}

variable "vpc_subnets" {
  type        = list(string)
  description = "Subnets to use"
}

variable "aws_ami_account_id" {
  type        = string
  description = "The account ID that owns the AMIs created by packer"
}

variable "instance_type_kafka" {
  type        = string
  default     = "t3.large"
  description = "Instance types to use for Kafka ec2 instances"
}

variable "instance_type_zookeeper" {
  type        = string
  default     = "t3.medium"
  description = "Instance types to use for zookeeper ec2 instances"
}
