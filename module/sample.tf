module "ec2" {
  source = "./ec2"
  sg_id = module.sg.sg_id

}

module "sg" {
  source = "./sg"
}

provider "aws" {
  region = "us-east-1"
}

output "public_ip" {
  value = module.ec2.public_ip
}
