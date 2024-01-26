resource "aws_instance" "example" {
  ami             = "ami-0a3c3a20c09d6f377" # Specify your AMI
  instance_type   = "t2.micro"
  subnet_id       = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  count           = var.instance_count
  key_name        = "final"

}

