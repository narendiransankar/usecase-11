output "s3_bucket"        { value = module.s3.bucket_id }
output "sns_topic_arn"    { value = module.sns.topic_arn }
output "cloudtrail_arn"   { value = module.cloudtrail.trail_arn }
#output "log_group_arn"    { value = module.cloudwatch.log_group_arn }
