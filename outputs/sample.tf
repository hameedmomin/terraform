#output "sample" {
  //value = "Hi everyone"
  //value = var.sample
}

output "sample" {
  value = var.sample1
}

variable "sample1" {
  default = "Myself"
}
