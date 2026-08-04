##############################################
# CloudFront Variables
##############################################

variable "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}