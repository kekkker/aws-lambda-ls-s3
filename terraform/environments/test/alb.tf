module "alb" {
  source = "../../modules/aws-alb"

  lb_security_groups = ["sg-0c7a3affa49ea31a0"]
  lb_subnets         = module.vpc.subnets.ids

  lb_lambda_name = module.lambda.lambda_name
  lb_lambda_arn  = module.lambda.lambda_arn

  lb_certificate_arn = "arn:aws:acm:eu-central-1:311141519436:certificate/fe01d89d-79ba-4a56-bbc6-40a9633416dc"
}

