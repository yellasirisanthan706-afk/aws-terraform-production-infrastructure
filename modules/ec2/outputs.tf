output "launch_template_id" {
  description = "Launch Template ID"
  value       = aws_launch_template.web.id
}

output "launch_template_latest_version" {
  description = "Latest Launch Template Version"
  value       = aws_launch_template.web.latest_version
}

output "autoscaling_group_name" {
  description = "Auto Scaling Group Name"
  value       = aws_autoscaling_group.web.name
}