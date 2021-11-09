//module "templates" {
//  source = "./launch"

//}

module "spot" {
  source                  = "./ec2"
  COMPONENTS              = var.COMPONENTS
}

module "ansible" {
  depends_on              = [module.spot]
  source                  = "./ansible"
  COMPONENTS              = var.COMPONENTS

}

