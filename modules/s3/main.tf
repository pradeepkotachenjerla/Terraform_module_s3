

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.versioning_status
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {

  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.bucket_policy.json

}

data "aws_iam_policy_document" "bucket_policy" {

  policy_id = "${var.bucket_name}-bucket-policy"
  statement {

    sid = "PublicReadGetObject"
    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.s3_bucket.arn}/*"
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}
