module "alb" {
  source = "../../modules/aws-alb"

  lb_security_groups = ["sg-0c7a3affa49ea31a0"]
  lb_subnets         = ["subnet-09ce82bd5799e0cb8", "subnet-0bdd77d2e3f01aa01"]

  lb_lambda_name = module.lambda.lambda_name
  lb_lambda_arn  = module.lambda.lambda_arn
}

