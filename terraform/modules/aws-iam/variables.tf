variable "iam_assume_policy_service" {
  type    = string
  default = "lambda.amazonaws.com"

  description = "Sevice that will be allowed to assume the role"
}

variable "iam_role_name" {
  type    = string
  default = "test-role"

  description = "IAM Role Name"
}

variable "iam_policy_name" {
  type    = string
  default = "test-policy"

  description = "IAM Policy Name"
}

variable "iam_policy_actions" {
  type = list(string)
  default = [
    "s3:ListBucket",
  ]

  description = "IAM Policy actions"
}

variable "iam_policy_resources" {
  type = list(string)

  description = "IAM Policy resources"
}
