output "arn" {
  value = aws_s3_bucket.s3.arn
}

output "name" {
  value = aws_s3_bucket.s3.id
}

output "domain" {
  value = aws_s3_bucket_website_configuration.s3.website_domain
}

output "endpoint" {
  value = aws_s3_bucket_website_configuration.s3.website_endpoint
}
