provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "curso-aws-terraform-164300071173-us-east-1-remote-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "curso-aws-terraform-164300071173-us-east-1-remote-state"
  }
}

locals {
  env = terraform.workspace
}

resource "aws_instance" "web" {
  ami           = lookup(var.ami, local.env)
  instance_type = lookup(var.type, local.env)

  tags = {
    Name         = "Minha máquina web ${local.env}"
    Env          = local.env
    Project_name = "Curso AWS com Terraform"
    Project_version = "1.0.0"
  }
}
