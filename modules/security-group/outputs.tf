output "alb_security_group_id" {

  value = aws_security_group.alb.id

}


output "ec2_security_group_id" {

  value = aws_security_group.ec2.id

}