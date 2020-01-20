provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "tfsantos-remote-state-dev"
    key    = "ec2/ec2.tfstate"
    region = "us-east-1"
  }
}

locals {
  conn_type = "ssh"
  conn_user = "ec2-user"
  conn_timeout = "1m"
  conn_key  = file("~/pems/tfsantos.pem")
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "tfsantos"

  connection {
    host        = self.public_ip
    type        = local.conn_type
    user        = local.conn_user
    private_key = local.conn_key
    timeout     = local.conn_timeout
  }

  provisioner "file" {
    source      = "2020-01-19.log"
    destination = "/tmp/file.log"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20",
      "echo \"[UPDATING THE SYSTEM]\"",
      "sudo yum update -y",
      "echo \"[INSTALLING HTTPD]\"",
      "sudo yum install -y httpd",
      "echo \"[STARTING HTTPD]\"",
      "sudo service httpd start",
      "sudo chkconfig httpd on",
      "echo \"[FINISHING]\"",
      "sleep 20",
    ]
  }
}

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.id}:${aws_instance.web.public_ip} >> public_ips.txt"
  }
}