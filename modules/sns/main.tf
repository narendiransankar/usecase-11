resource "aws_sns_topic" "cloudtrail_topic" {
  name = "cloudtrail-sns-topic"
  tags =var.project_tag
}
resource "aws_sns_topic_subscription" "cloudtrail_email_subscription" {
  topic_arn = aws_sns_topic.cloudtrail_topic.arn
  protocol  = "email"
  endpoint  = "narendiran.sankar@hcltech.com" 
}
