##############################################
# CloudFront Outputs
##############################################

output "distribution_id" {
  description = "CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.main.id
}

output "distribution_domain_name" {
  description = "CloudFront Domain Name"
  value       = aws_cloudfront_distribution.main.domain_name
}