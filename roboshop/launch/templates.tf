resource "aws_launch_template" "new" {
  name                       = "new"
  image_id                   = "ami-0855cab4944392d0a"

  instance_market_options {
    market_type              = "spot"
  }

  instance_type              = "t2.micro"


  placement {
    availability_zone        = "us-east-1"
  }


  vpc_security_group_ids     = ["sg-0b9ab8f976b104516"]

}

output "template_id" {
  value                      = "aws_launch_template.new_id"
}