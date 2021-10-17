variable "fruits" {
  default = ["apply", "banana"]
}

output "name_of_fruit" {
  value = ["element(var.fruits, 1 )", "length(var.fruits, 0)" ]
}