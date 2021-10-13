resource "aws_instance" "sample" {
  ami                     = "ami-074df373d6bafa625"
  instance_type           = "t2.micro"
}

terraform {
  backend "s3" {
    bucket                = "myroboshopbucket"
    key                   = "sample/terraform.tfstate"
    region                = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
