resource "aws_lb" "test_lb" {
  name               = "test-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.test_subnet.id,aws_subnet.test_subnet_1.id]  # Specify the subnet IDs where the load balancer should be placed
  security_groups    = [aws_security_group.instance.id]  # Specify the security group ID for the load balancer
}

resource "aws_lb_listener" "test_listener" {
  load_balancer_arn = aws_lb.test_lb.arn  # ARN of the load balancer
  port              = 80                   # Listener port
  protocol          = "HTTP"               # Listener protocol

  default_action {
    type             = "forward"           # Forward action
    target_group_arn = aws_lb_target_group.test_target_group.arn  # ARN of the target group
  }
}

