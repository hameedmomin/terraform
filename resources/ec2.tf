resource "aws_instance" "s1" {
  ami             = "ami-074df373d6bafa625"
  instance_type   = "t2.micro"
}

provider "aws" {
  region = "us-east-1"
}
# their is no option to create instances with templates so we directly create with spot instance

terraform {
  backend "s3" {
    bucket = "myroboshopbucket"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table        = "terraform"
  }
}
