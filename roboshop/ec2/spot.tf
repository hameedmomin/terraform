resource "aws_spot_instance_request" "mywork" {
  ami              = "ami-074df373d6bafa625"
  spot_price       = "0.0035"
  instance_type    = "t2.micro"

  tags = {
    Name           = "mywork"
  }
}
provider "aws" {
  region           = "us-east-1"
}