variable "metric_name" {
  type        = string
  description = "Name of the CloudWatch metric to alarm on"
}

variable "metric_namespace" {
  type        = string
  description = "Namespace of the CloudWatch metric"
}

variable "alarm_name" {
  type        = string
  description = "Name of the CloudWatch alarm"
}

variable "alarm_description" {
  type        = string
  description = "Description of the CloudWatch alarm"
}

variable "statistic" {
  type        = string
  description = "Statistic to apply to the metric"
}

variable "period" {
  type        = number
  description = "Period (in seconds) over which the specified statistic is applied"
}

variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "threshold" {
  type        = number
  description = "The value against which the specified statistic is compared"
}

variable "comparison_operator" {
  type        = string
  description = "The arithmetic operation to use when comparing the specified statistic and threshold"
}

variable "sns_topic_arn" {
  type        = string
  description = "SNS Topic ARN to notify when the alarm state is triggered"
}

variable "project_tag" {
description = "The project_tag for this project"
type = map(string)
}
