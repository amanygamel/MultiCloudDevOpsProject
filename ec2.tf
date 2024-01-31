resource "aws_instance" "example_instance" {
  ami           = "your-ami-id"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.cloudwatch_instance_profile.name
}

