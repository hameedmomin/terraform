data "aws_dynamodb_table" "table" {
  name = "myrobohsop"
}

output "table" {
  value = data.aws_dynamodb_table.table
}