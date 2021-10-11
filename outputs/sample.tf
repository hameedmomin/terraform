output "sample" {
  //value = "Hi everyone"
  value = var.sample1
}

output "sample1" {
  value = "${var.sample1}"
}

variable "sample1" {
  default = "Myself"
}
