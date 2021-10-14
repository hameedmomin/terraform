terraform {
  backend "s3" {
    bucket = "myroboshopbucket"
    key = "roboshop/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "myroboshop"

  }
}

provider "aws" {
  region = "us-east-1"
}