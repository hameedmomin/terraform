output "sample" {
  //value = "Hi everyone"
  value = var.sample1
}

output "sample1" {
  value = "${var.sample1} hameed"
}

variable "sample1" {
  default = "Myself"
}


## Variable sample can be accessed as var.sample or ${var.sample}, However
## var.sample is used without quotes
## ${var.sample} is used within quotes.
## Usually ${} used only when you combine with some other data
## Single quotes does not support by terraform at any level. Supports only double quotes.

# String Data type
variable "s1" {
  default = "good boy"
}

output "s1" {
  value = "s1"
}