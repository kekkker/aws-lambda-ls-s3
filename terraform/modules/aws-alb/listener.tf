resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.this.arn
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
