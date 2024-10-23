data "archive_file" "this" {
  type        = var.lambda_archive_file_type
  source_file = var.lambda_source_file_path
  output_path = "${var.lambda_source_file_path}.zip"
}

resource "aws_lambda_function" "this" {
  filename         = "${var.lambda_source_file_path}.zip"
  function_name    = var.lambda_function_name
  role             = var.lambda_iam_role_arn
  handler          = var.lambda_function_handler
  source_code_hash = data.archive_file.this.output_base64sha256
  timeout          = var.lambda_function_timeout

  environment {
    variables = var.lambda_function_env_variables
  }

  runtime = "python3.12"
}
