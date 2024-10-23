data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "lambda_s3_access" {
  statement {
    effect = "Allow"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "${aws_s3_bucket.lambda-s3.arn}/*",
      "${aws_s3_bucket.lambda-s3.arn}",
    ]
  }
}

resource "aws_iam_role_policy_attachment" "lambda_s3_access_attach" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_s3_access_policy.arn
}

resource "aws_iam_policy" "lambda_s3_access_policy" {
  name   = "LambdaS3AccessPolicy"
  policy = data.aws_iam_policy_document.lambda_s3_access.json
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "main.py"
  output_path = "main.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename         = "main.zip"
  function_name    = "main-python"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "main.handler"
  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.12"
}
