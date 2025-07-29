resource "aws_cloudtrail" "main" {
  name                          = var.cloud_trail_name
  s3_bucket_name                = var.cloud_trail_bucket_name
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true

  cloud_watch_logs_group_arn    = "${var.cloud_watch_logs_group_arn}:*"
  cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_role.arn

  event_selector {
    read_write_type              = "All"
    include_management_events   = true
  }

  tags = var.project_tag

  depends_on = [
    aws_iam_role_policy_attachment.cloudtrail_policy_attachment,
  ]
}
