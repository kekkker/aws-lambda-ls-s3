resource "aws_s3_bucket" "lambda-s3" {
  bucket = "s3-exmaple-lambda-test-foo-bar"

  tags = {
    Name = "Example Lambda Bucket"
  }
}
