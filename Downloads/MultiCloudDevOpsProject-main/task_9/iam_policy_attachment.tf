resource "aws_iam_role_policy_attachment" "cloudwatch_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role       = aws_iam_role.cloudwatch_role.name
}
