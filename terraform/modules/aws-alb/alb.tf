resource "aws_lb" "this" {
  name               = var.lb_name
  load_balancer_type = var.lb_type
  security_groups    = var.lb_security_groups
  subnets            = var.lb_subnets

  tags = {
    Name = "lambda-alb"
  }
}
