data "aws_dynamodb_table" "table" {
  name = "myroboshop"
}

output "table" {
  value = data.aws_dynamodb_table.table
}