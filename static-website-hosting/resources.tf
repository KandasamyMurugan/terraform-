resource "aws_s3_bucket" "static-website" {
  bucket = "web-bucket-kandadevops"

}
resource "aws_s3_bucket_public_access_block" "bucket1" {
  bucket = aws_s3_bucket.static-website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "index" {
  bucket       = "web-bucket-kandadevops"
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = "web-bucket-kandadevops"
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
}


resource "aws_s3_bucket_website_configuration" "bucket1" {
  bucket = aws_s3_bucket.static-website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.static-website.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
	  "Principal": "*",
      "Action": [ "s3:GetObject" ],
      "Resource": [
        "${aws_s3_bucket.static-website.arn}",
        "${aws_s3_bucket.static-website.arn}/*"
      ]
    }
  ]
}
EOF
}