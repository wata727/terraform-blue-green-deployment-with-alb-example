resource "aws_alb" "test" {
  name            = "test-alb-tf"
  internal        = false
  security_groups = "${var.alb_security_groups}"
  subnets         = "${var.subnets}"
}

resource "aws_alb_target_group" "green" {
  name     = "tf-example-alb-tg-green"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc}"
}

resource "aws_alb_target_group" "blue" {
  name     = "tf-example-alb-tg-blue"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc}"
}

resource "aws_alb_listener" "test" {
   load_balancer_arn = "${aws_alb.test.arn}"
   port = "80"
   protocol = "HTTP"
   default_action {
     target_group_arn = "${aws_alb_target_group.blue.arn}"
     type = "forward"
   }
}

resource "aws_alb_listener_rule" "green" {
  listener_arn = "${aws_alb_listener.test.arn}"
  priority = 50

  action {
    type = "forward"
    target_group_arn = "${aws_alb_target_group.green.arn}"
  }

  condition {
    field = "path-pattern"
    values = ["/*"]
  }
}
