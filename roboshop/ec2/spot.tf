resource "aws_spot_instance_request" "mywork" {
  count                  = length(var.COMPONENTS)
  ami                    = "ami-0dc863062bc04e1de"
  spot_price             = "0.0035"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0b9ab8f976b104516"]
  wait_for_fulfillment   = "true"

  tags = {
    Name                 = element(var.COMPONENTS, count.index)

  }
}

##wait_for_fulfillment will wait untill this instances are created and then it will upgrade it


variable "COMPONENTS" {}


resource "time_sleep" "wait" {
  depends_on              = [aws_spot_instance_request.mywork]
  create_duration         = "120s"
}

resource "aws_ec2_tag" "spot" {
  depends_on              = [time_sleep.wait]
  count                   = length(var.COMPONENTS)
  resource_id             = element(aws_spot_instance_request.mywork.*.spot_instance_id, count.index )
  key                     = "Name"
  value                   = element(var.COMPONENTS, count.index)
}
provider "aws" {
  region                  = "us-east-1"
}
resource "aws_ec2_tag" "monitor" {
  depends_on              = [time_sleep.wait]
  count                   = length(var.COMPONENTS)
  resource_id             = element(aws_spot_instance_request.mywork.*.spot_instance_id, count.index )
  key                     = "Monitor"
  value                   = "yes"
}

resource "aws_route53_record" "dns" {
  depends_on              = [time_sleep.wait]
  count                   = length(var.COMPONENTS)
  zone_id                 = "Z05483541JD3IOXLSP16I"
  name                    = "${element(var.COMPONENTS, count.index)}.connection.internal"
  type                    = "A"
  ttl                     = "300"
  records                 = [element(aws_spot_instance_request.mywork.*.private_ip, count.index)]

}

