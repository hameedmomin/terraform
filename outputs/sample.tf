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


#List variable
variable "s4" {
  default = [
  "hameed",200,true,"happy"
  ]
}

output "s4" {
  value = var.s4[3]

}

#Mapping variable
variable "s5" {
  default = {
    string = "hameed",
    number = 200,
    boolean = true
  }
}

output "s5" {
  value = var.s5["number"]
}

variable "s6" {}

output "s6" {
  value = var.s6
}
#remember that if we keep value in double quotes it will be hardcoded so we dont keep value in double quotes
variable "s7" {}

output "s7" {
  value = var.s7
}

variable "Myself" {}

output "Myself" {
  value = var.Myself
}