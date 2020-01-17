provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "aws_s3_bucket" "b" {
  bucket = "tfsantos-bucket"
  acl    = "private"

  tags = {
    Name        = "Meu super bucket"
    Environment = "Prod"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.id
  key    = "helloworld.txt"
  source = "arquivo.txt"
  etag = filemd5("arquivo.txt")
}

output "bucket" {
  value = aws_s3_bucket.b.id
}

output "etag" {
  value = aws_s3_bucket_object.object.etag
}
