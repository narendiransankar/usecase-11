variable "cloud_trail_bucket_name" {
description = "The cloud_trail_bucket_name for storing the cloud Trail logs"
type = string 
}
variable "project_tag" {
description = "The project_tag for this project"
type = map(string)
}
variable "cloud_trail_name" {
description = "The Cloud Trail name" 
type = string
}

variable "aws_region" {
description = "The region we are creating the resources"
}

variable "metric_name" {
  description = "Name of the CloudWatch metric"
  type        = string
  default     = "ConsoleLoginEventCount"
}

variable "metric_namespace" {
  description = "Namespace of the CloudWatch metric"
  type        = string
  default     = "CloudTrailMetrics"
}

variable "alarm_name" {
  description = "Name of the CloudWatch alarm"
  type        = string
  default     = "ConsoleLoginAlarm"
}

variable "alarm_description" {
  description = "Description for the CloudWatch alarm"
  type        = string
  default     = "Triggers on AWS Console login attempts"
}

variable "statistic" {
  description = "Statistic to apply to the metric"
  type        = string
  default     = "Sum"
}

variable "period" {
  description = "Period (in seconds) to evaluate the metric"
  type        = number
  default     = 300
}

variable "evaluation_periods" {
  description = "Number of evaluation periods for the alarm"
  type        = number
  default     = 1
}

variable "threshold" {
  description = "Threshold value for the alarm"
  type        = number
  default     = 1
}

variable "comparison_operator" {
  description = "Comparison operator for the threshold"
  type        = string
  default     = "GreaterThanOrEqualToThreshold"
}
#
