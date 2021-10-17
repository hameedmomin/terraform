resource "null_resource" "ansible" {

  count               = length(var.COMPONENTS)
  provisioner "remote-exec" {

    connection {
      host            = "${element(var.COMPONENTS, count.index)}.connection.internal"
      user            = "centos"
      password        = "DevOps321"
    }

    inline = [
      "sudo yum install ansible -y",
      "sudo yum remove ansible -y",
      "sudo pip install ansible==3.4.0",
      "ansible-pull -i localhost, -U https://github.com/hameedmomin/ansible.git roboshop-pull.yml -e COMPONENT=${element(var.COMPONENTS, count.index)}"
    ]

  }

}

variable "COMPONENTS" {}