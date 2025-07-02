resource "aws_s3_bucket" "app_bucket" {
  bucket = "${var.bucket_name}-${var.env}"
  # acl argument removed as it is deprecated

  tags = {
    Name        = "${var.bucket_name}-${var.env}"
    Environment = var.env
  }
}
