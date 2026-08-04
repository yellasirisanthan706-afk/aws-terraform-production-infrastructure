##############################################
# ACM Outputs
##############################################

output "certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = aws_acm_certificate.main.arn
}

output "domain_name" {
  description = "Certificate domain name"
  value       = aws_acm_certificate.main.domain_name
}

output "domain_validation_options" {
  description = "DNS validation options"
  value       = aws_acm_certificate.main.domain_validation_options
}