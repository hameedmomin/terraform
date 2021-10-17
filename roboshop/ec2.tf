//module "templates" {
//  source = "./launch"

//}

module "spot" {
  source       = "./ec2"
  COMPONENTS   = var.COMPONENTS
}

