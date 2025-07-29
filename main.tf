

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.trail_bucket_name
  tags        = { Name = var.trail_bucket_name }
}

module "sns" {
  source     = "./modules/sns"
  topic_name = var.sns_topic_name
  email      = var.notification_email
}

module "cloudwatch" {
  source           = "./modules/cloudwatch"
  log_group_name   = var.log_group_name
  retention        = var.log_retention_days
  metric_name      = var.metric_name
  metric_namespace = var.metric_namespace
  alarm_name       = var.alarm_name
  sns_topic_arn    = module.sns.topic_arn
}

module "cloudtrail" {
  source        = "./modules/cloudtrail"
  trail_name    = var.trail_name
  s3_bucket     = module.s3.bucket_id
  #log_group_arn = module.cloudwatch.log_group_arn
  log_group_name = module.cloudwatch.log_group_name
  log_group_depends_on = module.cloudwatch.log_group_arn
}
