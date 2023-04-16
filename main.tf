resource "aws_s3_bucket" "s3" {
  bucket = var.s3_bucket_name
  force_destroy = true
  
}

resource "aws_s3_bucket_acl" "s3" {
  bucket = aws_s3_bucket.s3.id
  acl = "public-read"
}

resource "aws_s3_bucket_policy" "s3" {
  bucket = aws_s3_bucket.s3.id
  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_bucket_name}/*"
            ]
        }
    ]
  }  
  EOF
}

resource "aws_s3_bucket_website_configuration" "s3" {
  bucket = aws_s3_bucket.s3.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}