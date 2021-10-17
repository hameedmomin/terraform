//module "templates" {
//  source = "./launch"

//}

module "frontend" {
  source       = "./ec2"
  COMPONENTS   = var.COMPONENTS
}

