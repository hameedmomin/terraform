resource "aws_spot_instance_request" "mywork" {
  count            = length(var.COMPONENTS)
  ami              = "ami-0e4e4b2f188e91845"
  spot_price       = "0.0035"
  instance_type    = "t2.micro"
  key_name         = element(var.COMPONENTS, count.index )


  tags = {
    Name           = element(var.COMPONENTS, count.index)

  }
}
provider "aws" {
  region           = "us-east-1"
}

variable "COMPONENTS" {}
