output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.main.arn
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = aws_lb.main.dns_name
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.web.arn
}

output "target_group_name" {
  description = "Target Group Name"
  value       = aws_lb_target_group.web.name
}

output "alb_dns_name" {

  description = "Application Load Balancer DNS Name"

  value = aws_lb.main.dns_name

}