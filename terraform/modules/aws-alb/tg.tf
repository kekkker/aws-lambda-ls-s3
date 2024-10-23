resource "aws_lb_target_group" "this" {
  name        = var.lb_target_group_name
  target_type = var.lb_target_group_type
  vpc_id      = var.lb_vpc_id
}
