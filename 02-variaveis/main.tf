provider "aws" {
  profile = var.profile
  region  = var.region
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  
  #ipv6_addresses = var.ips

  tags = var.tags
}