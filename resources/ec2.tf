resource "aws_instance" "s1" {
  ami             = "ami-074df373d6bafa625"
  instance_type   = "t2.micro"
}

provider "aws" {
  region = "us-east-1"
}
#terraform {
#  backend "s3" {
#    bucket                = "terraform-batch56"
#    key                   = "sample/terraform.tfstate"
#    region                = "us-east-1"
#    dynamodb_table        = "terraform"
#  }