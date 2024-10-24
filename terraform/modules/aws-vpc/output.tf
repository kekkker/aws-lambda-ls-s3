output "all" {
  value = data.aws_vpc.this
}

output "subnets" {
  value = data.aws_subnets.this
}
