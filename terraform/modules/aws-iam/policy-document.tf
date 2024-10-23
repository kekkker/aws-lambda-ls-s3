data "aws_iam_policy_document" "sts" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = [var.iam_assume_policy_service]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"

    actions = var.iam_policy_actions

    resources = var.iam_policy_resources

  }
}
