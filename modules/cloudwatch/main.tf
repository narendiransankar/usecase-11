resource "aws_cloudwatch_log_group" "this" {
  name              = var.log_group_name
  retention_in_days = var.retention
}

resource "aws_cloudwatch_log_metric_filter" "console_login" {
  name           = "ConsoleLoginSuccessFilter"
  log_group_name = aws_cloudwatch_log_group.this.name
  pattern        = "{ ($.eventName = \"ConsoleLogin\") && ($.responseElements.ConsoleLogin = \"Success\") }"
  metric_transformation {
    name      = var.metric_name
    namespace = var.metric_namespace
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "console_login_alarm" {
  alarm_name          = var.alarm_name
  alarm_description   = "Triggers when AWS Console login is detected"
  metric_name         = var.metric_name
  namespace           = var.metric_namespace
  statistic           = "Sum"
  period              = 60
  evaluation_periods  = 1
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  treat_missing_data  = "notBreaching"
  alarm_actions       = [var.sns_topic_arn]
}
