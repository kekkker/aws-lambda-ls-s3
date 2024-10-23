output "lambda_name" {
  value = aws_lambda_function.this.id
}

output "lambda_arn" {
  value = aws_lambda_function.this.arn
}
