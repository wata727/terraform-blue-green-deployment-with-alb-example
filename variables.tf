variable "vpc" {
  default = "vpc-xxxxxxx"
}

variable "alb_security_groups" {
  default = ["sg-xxxxxxxx"]
}

variable "subnets" {
  default = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
}

variable "blue_image" {
  default = "ami-xxxxxxxx"
}

variable "green_image" {
  default = "ami-yyyyyyyy"
}

variable "instance_security_groups" {
  default = ["sg-yyyyyyyy"]
}
