resource "aws_s3_bucket" "log_bucket" {
  bucket = var.cloud_trail_bucket_name
  tags  = var.project_tag
}
resource "aws_s3_bucket_policy" "log_bucket_policy" {
  bucket = aws_s3_bucket.log_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "s3:PutObject"
        Resource  = "${aws_s3_bucket.log_bucket.arn}/*"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
      },
      {
        Effect    = "Allow"
        Action    = "s3:GetBucketAcl"
        Resource  = "${aws_s3_bucket.log_bucket.arn}"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
      }
    ]
  })
}

#resource "aws_s3_bucket_acl" "log_bucket_acl" {
#  bucket = aws_s3_bucket.log_bucket.bucket
#  acl    = "private" 
#}
