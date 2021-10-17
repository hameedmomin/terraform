resource "aws_spot_instance_request" "mywork" {
  count                  = length(var.COMPONENTS)
  ami                    = "ami-0e4e4b2f188e91845"
  spot_price             = "0.0035"
  instance_type          = "t2.micro"


  tags = {
    Name                 = element(var.COMPONENTS, count.index)

  }
}
variable "COMPONENTS" {}

resource "time_sleep" "wait" {
  depends_on              = [aws_spot_instance_request.mywork]
  create_duration         = "120s"
}

resource "aws_ec2_tag" "spot" {
  count                   = length(var.COMPONENTS)
  resource_id             = element(aws_spot_instance_request.mywork.*.spot_instance_id, count.index )
  key                     = "Name"
  value                   = element(var.COMPONENTS, count.index)
}
provider "aws" {
  region                  = "us-east-1"
}

resource "aws_route53_record" "dns" {
  count                   = length(var.COMPONENTS)
  zone_id                 = "Z05483541JD3IOXLSP16I"
  name                    = "${element(var.COMPONENTS, count.index)}.connection.internal"
  type                    = "A"
  ttl                     = "300"
  records                 = [element(aws_spot_instance_request.mywork.*.private_ip, count.index)]

}

