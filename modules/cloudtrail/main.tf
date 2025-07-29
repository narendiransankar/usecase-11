data "aws_caller_identity" "current" {}

locals {
  log_group_arn = "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:${var.log_group_name}"
}

resource "aws_iam_role" "cloudtrail_cwlogs" {
  name = "${var.trail_name}-cloudwatch-logs"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "cloudtrail.amazonaws.com" },
      Action   = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "cloudtrail_cwlogs" {
  name = "${var.trail_name}-cwlogs"
  role = aws_iam_role.cloudtrail_cwlogs.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["logs:CreateLogStream", "logs:PutLogEvents"],
        Resource = "${var.log_group_arn}:log-stream:*"
      }
    ]
  })
}

resource "aws_cloudtrail" "this" {
  name                          = var.trail_name
  s3_bucket_name                = var.s3_bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
  cloud_watch_logs_group_arn    = var.log_group_arn
  cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_cwlogs.arn
  depends_on = [var.log_group_depends_on]
}
