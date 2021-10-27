 terraform {
   backend "s3" {
     bucket          = "myroboshopbucket"
     key             = "template/terraform.tf"
//     dynamodb_table  = "myroboshop"
     region          = "us-east-1"
   }
 }

 provider "aws" {
   region = "us-east-1"
 }