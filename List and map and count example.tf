variable "region" {
  default = "ap-south-1"
}

variable "mappi" {
  type = map
  default = {
    "us-east-1"  = "ami-032930428bf1abbff"
    "ap-south-1" = "ami-03cfb5e1fb4fac428"
  }
}
variable "lissti" {
  type    = list
  default = ["name1", "name2"]
}

resource aws_instance "server1" {
  ami           = lookup(var.mappi, var.region)
  instance_type = "t2.medium"
  count         = 2
  tags = {
    name = element(var.lissti, count.index)
  }
}
resource aws_instance "server2" {
  ami           = lookup(var.mappi, var.region)
  instance_type = "t2.medium"
  count         = 2
  provider      = aws.hello
  tags = {
    name = element(var.lissti, count.index)
  }
}
