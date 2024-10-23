resource "aws_lb" "test" {
  name               = "lambda-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [for subnet in aws_subnet.public_subnets : subnet.id]

  enable_deletion_protection = false

  # TODO: add access_logs
  #  access_logs {
  #  }

  tags = {
    Name = "lambda-alb"
  }
}
