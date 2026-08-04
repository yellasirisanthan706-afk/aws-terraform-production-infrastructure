##############################################
# Route53 Variables
##############################################

variable "domain_name" {
  description = "Domain name for the hosted zone"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}