resource "aws_spot_instance_request" "mywork" {
  count            = length(var.COMPONENTS)
  ami              = "ami-074df373d6bafa625"
  spot_price       = "0.0035"
  instance_type    = "t2.micro"


  tags = {
    Name           = element(var.COMPONENTS, count.index)
  }
}
provider "aws" {
  region           = "us-east-1"
}

variable "COMPONENTS" {}
