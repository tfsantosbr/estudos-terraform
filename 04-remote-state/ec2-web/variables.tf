variable "region" {
    default = "us-east-1"
    description = "Região principal"
}

variable "ami" {
    default = "ami-062f7200baf2fa504"
}

variable "instance_type" {
    default = "t2.micro"
}