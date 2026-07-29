resource "aws_lb" "main" {

  name               = "prod-alb"

  internal           = false

  load_balancer_type = "application"

  security_groups = [
    var.alb_security_group_id
  ]

  subnets = var.public_subnet_ids

  tags = {
    Name = "prod-alb"
  }

}

resource "aws_lb_target_group" "web" {

  name     = "prod-target-group"

  port     = 80

  protocol = "HTTP"

  vpc_id   = var.vpc_id

  target_type = "instance"

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2

  }

  tags = {
    Name = "prod-target-group"
  }

}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.main.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.web.arn

  }

}