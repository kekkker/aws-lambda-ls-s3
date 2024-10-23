module "iam" {
  source = "../../modules/aws-iam"

  iam_policy_resources = ["arn:aws:s3:::s3-exmaple-lambda-test-foo-bar"]
}
