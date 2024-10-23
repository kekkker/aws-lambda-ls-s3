resource "aws_s3_bucket" "lambda-s3" {
  bucket = "s3-exmaple-lambda-test-foo-bar"

  tags = {
    Name = "Example Lambda Bucket"
  }
}
data "aws_iam_policy_document" "allow_lambda_access" {
  statement {
    effect  = "Allow"
    actions = ["s3:ListBucket"]
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.iam_for_lambda.arn]
    }
    resources = [
      "${aws_s3_bucket.lambda-s3.arn}/*",
      "${aws_s3_bucket.lambda-s3.arn}"
    ]
  }
}

resource "aws_s3_bucket_policy" "allow_lambda_access" {
  bucket = aws_s3_bucket.lambda-s3.id

  policy = data.aws_iam_policy_document.allow_lambda_access.json
}
