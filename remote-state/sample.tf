resource "aws_instance" "sample" {
  ami                     = "ami-0dc863062bc04e1de"
  instance_type           = "t2.micro"
}

terraform {
  backend "s3" {
    bucket                = "myroboshopbucket"
    key                   = "sam/terraform.tfstate"
    region                = "us-east-1"
    dynamodb_table        = "myroboshop"
  }
}

provider "aws" {
  region = "us-east-1"
}

output "public_ip" {
  value = aws_instance.sample.public_ip
}