variable "alb_security_group_id" {
  description = "Security Group ID for the ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the Target Group will be created"
  type        = string
}