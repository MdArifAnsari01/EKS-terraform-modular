data "aws_s3_bucket" "backend" {
  bucket= "terraform-s3-backend-011201"
}

output "s3_bucket_name" {
  value       = data.aws_s3_bucket.backend.id
  description = "The name of the S3 bucket"
}