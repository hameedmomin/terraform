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
# it should be quoted in double qoute

variable "s1" {
  default = "good boy"
}

output "s1" {
  value = "${var.s1}"
}

#Number Data type ; it not quoted
variable "s2" {
  default = 100
}
 output "s2" {
   value = var.s2
   }

#Boolen data type
variable "s3" {
  default = true
}
output "s3" {
  value = var.s3
}

# Strings data should be quoted in double-quotes, But whereas numbers and booleans need not to be.

variable "s4" {
  default = [
  "hameed",200,true
  ]
}

output "s4" {
  value = var.s4
}

output "s5" {
  value = var.s5
}
variable "s5" {
  default = {
    string = "hameed",
    number = 200,
    boolean = true
  }
}
