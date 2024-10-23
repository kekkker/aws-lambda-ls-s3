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
