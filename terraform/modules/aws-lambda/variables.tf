variable "lambda_archive_file_type" {
  type    = string
  default = "zip"

  description = "Type of the Lambda Archive"
}

variable "lambda_source_file_path" {
  type    = string
  default = "main.py"

  description = "Where the code for the lambda is located"
}

variable "lambda_function_name" {
  type    = string
  default = "test-function"

  description = "Name of the Lambda function"
}

variable "lambda_iam_role_arn" {
  type = string

  description = "Name of the Lambda function role"
}

variable "lambda_function_handler" {
  type    = string
  default = "main.handler"

  description = "Name of the Lambda function handler"
}

variable "lambda_function_timeout" {
  type    = number
  default = 10

  description = "Time for lambda to timeout"
}

variable "lambda_function_env_variables" {
  type = map(string)


  description = "Env vars to put into the lambda"
}
