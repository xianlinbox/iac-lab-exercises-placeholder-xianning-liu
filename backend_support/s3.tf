resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "${var.prefix}-tfstate"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_versioning" "tf_state_bucket_versionning" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_bucket_encryption" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}


resource "aws_s3_bucket_public_access_block" "tf_state_bucket_acl" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
