//variable "COMPONENTS" {
 // default      = [ "frontend", "mongodb", "catalogue", "mysql", "rabbitmq", "user", "payment", "shipping", "redis", "cart" ]
//}

variable "COMPONENTS" {
  default     = ["cart","shipping"]

}
