variable "region" {
    default = "us-east-1"
    description = "Região principal"
}

variable "profile" {
    default = "default"
    description = "Profile principal"
}

variable "ami" {
    default = "ami-062f7200baf2fa504"
}

variable "instance_type" {
}

variable "ips" {
    type = list
    default = ["111:222:333", "444:555:666", "777:888:999"]
}

variable "tags" {
    type = map
    default = {
        "Name" = "Nodejs"
        "Env" = "Dev"
    }
}