resource "aws_s3_bucket" "secure_bucket" {
  bucket = "secure-terraform-s3-bucket-aao"

  tags = {
    Name = "Demo bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "secure" {
  bucket                  = aws_s3_bucket.secure_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
