variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
}

variable "security_group_id" {
  description = "Security Group ID for the EC2 instance"
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
}

