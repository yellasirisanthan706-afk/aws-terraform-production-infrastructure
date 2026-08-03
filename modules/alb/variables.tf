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
variable "environment" {
  description = "Environment name"
  type        = string
}

variable "target_group_port" {
  description = "Target Group port"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Target Group protocol"
  type        = string
  default     = "HTTP"
}