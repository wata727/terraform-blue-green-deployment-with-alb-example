resource "aws_launch_configuration" "blue" {
    name = "blue-image"
    image_id = "${var.blue_image}"
    instance_type = "t2.nano"
    key_name = "batch-key"
    security_groups = "${var.instance_security_groups}"
}

resource "aws_launch_configuration" "green" {
    name = "green-image"
    image_id = "${var.green_image}"
    instance_type = "t2.nano"
    key_name = "batch-key"
    security_groups = "${var.instance_security_groups}"
}

resource "aws_autoscaling_group" "blue" {
  name = "blue-environment"
  max_size = 1
  min_size = 1
  launch_configuration = "${aws_launch_configuration.blue.name}"
  vpc_zone_identifier = "${var.subnets}" 
  target_group_arns = ["${aws_alb_target_group.blue.arn}"]
}

resource "aws_autoscaling_group" "green" {
  name = "green-environment"
  max_size = 1
  min_size = 1
  launch_configuration = "${aws_launch_configuration.green.name}"
  vpc_zone_identifier = "${var.subnets}"
  target_group_arns = ["${aws_alb_target_group.green.arn}"]
}
