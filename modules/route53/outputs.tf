##############################################
# Route53 Outputs
##############################################

output "hosted_zone_id" {
  description = "Hosted Zone ID"
  value       = aws_route53_zone.main.zone_id
}

output "hosted_zone_name" {
  description = "Hosted Zone Name"
  value       = aws_route53_zone.main.name
}

output "name_servers" {
  description = "Route53 Name Servers"
  value       = aws_route53_zone.main.name_servers
}