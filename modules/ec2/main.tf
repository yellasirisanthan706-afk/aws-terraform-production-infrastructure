##############################################
# Launch Template
##############################################

resource "aws_launch_template" "web" {

  name_prefix   = "prod-launch-template-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    var.ec2_security_group_id
  ]

  # Attach IAM Instance Profile
  iam_instance_profile {
    name = var.instance_profile_name
  }

  # Startup Script
  user_data = base64encode(file("${path.module}/user_data.sh"))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "prod-web"
    }
  }

}

##############################################
# Auto Scaling Group
##############################################

resource "aws_autoscaling_group" "web" {

  name = "prod-asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = var.private_subnet_ids

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "prod-web"
    propagate_at_launch = true
  }

}