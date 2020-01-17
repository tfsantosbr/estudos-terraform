provider "aws" {
  region  = var.region
}

# resource para gerar um id randomico

resource "random_id" "bucket_1" {
  byte_length = 8
}

resource "random_id" "bucket_2" {
  byte_length = 8
}

# criação de 2 buckets através do módulo

module "bucket-1" {
  source = "./s3"
  name = "tfsantos-bucket-${random_id.bucket_1.hex}"
  versioning = true
  tags = {
    Name = "Meu bucket de anotações"
  }
  create_object = true
  object_key = "files/${random_id.bucket_1.dec}.txt"
  object_source = "file.txt"
}

module "bucket-2" {
  source = "./s3"
  name = "tfsantos-bucket-${random_id.bucket_2.hex}"
}