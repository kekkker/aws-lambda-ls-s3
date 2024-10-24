module "lambda" {
  source = "../../modules/aws-lambda"

  lambda_source_file_path = "../../../lambda/main.py"
  lambda_iam_role_arn     = module.iam.role_arn
  lambda_function_env_variables = {
    "S3_BUCKET_NAME" = "s3-exmaple-lambda-test-foo-bar"
  }
}
